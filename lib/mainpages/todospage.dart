import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themedata.dart';
import 'package:get_done/data.dart';
// import 'package:gradient_icon/gradient_icon.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: GradientText(
          'ToDos',
          colors: [
            personalizedColor,
            personalizedColor.withValues(alpha: 0.5),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(
              Icons.filter_list_rounded,
              size: 40,
              color: personalizedColor,
            ),
            onPressed: () {
              //todo filter and sort todos option
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, right: 10, left: 10),
        child: ReorderableListView.builder(
          onReorder: (oldIndex, newIndex) {
            setState(
              () {
                if (newIndex > oldIndex) {
                  newIndex -= 1;
                }
                final item = todos.removeAt(oldIndex);
                todos.insert(newIndex, item);
              },
            );
          },
          itemCount: todos.length,
          itemBuilder: (context, index) {
            if (todos[index]['todo_is_done'] == true) {
              return SizedBox.shrink(
                key: ValueKey(todos[index]),
              );
            }

            Map todo = todos[index];
            String todoTitle = todo['todo_title'];
            String todoDueDate = todo['todo_due_date'];
            bool? todoIsDone = todo['todo_is_done'];

            Map project = projects[todo['project_id']]!;
            Color projectColor = project['project_color'];
            IconData projectIcon = project['project_icon'];

            return Dismissible(
              key: ValueKey(todos[index]),
              direction: DismissDirection.horizontal,
              onDismissed: (direction) {
                setState(() {
                  if (direction == DismissDirection.endToStart) {
                    todo['isDone'] = true;
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${todo['title']} marked as done!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  } else if (direction == DismissDirection.startToEnd) { //todo useful action
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('${todo['title']} deleted!'),
                        duration: Duration(seconds: 2),
                      ),
                    );
                  }
                });
              },
              background: Container(
                color: Colors.red,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.delete,
                  color: Colors.white,
                ),
              ),
              secondaryBackground: Container(
                color: Colors.green,
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Icon(
                  Icons.check,
                  color: Colors.white,
                ),
              ),
              child: Container(
                margin: EdgeInsets.only(bottom: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Theme.of(context).colorScheme.primaryContainer,
                ),
                child: CheckboxListTile(
                  title: Text(
                    todoTitle,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        color: Color.alphaBlend(
                            personalizedColor.withValues(alpha: 0.1),
                            Theme.of(context).colorScheme.secondary)),
                  ),
                  subtitle: Text(todoDueDate),
                  value: todoIsDone,
                  onChanged: (value) {
                    setState(() {
                      todo['todo_is_done'] = value!;
                    });
                  },
                  checkboxShape: CircleBorder(),
                  checkboxScaleFactor: 1.3,
                  secondary: Icon(
                    projectIcon,
                    color: projectColor,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

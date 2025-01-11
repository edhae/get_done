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
            return Container(
              key: ValueKey(todos[index]),
              margin: EdgeInsets.only(bottom: 7),
              padding: EdgeInsets.symmetric(horizontal: 3),
              decoration: BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).colorScheme.primaryContainer,
                border: Border.all(
                  color: todos[index]['project_color'],
                  width: 3,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: CheckboxListTile(
                  title: GradientText(
                    todos[index]['title'],
                    colors: [
                      personalizedColor,
                      personalizedColor.withValues(alpha: 0.5),
                    ],
                  ),
                  subtitle: Text(todos[index]['due_date']),
                  value: todos[index]['done'],
                  onChanged: (value) {
                    setState(() {
                      todos[index]['done'] = value;
                    });
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

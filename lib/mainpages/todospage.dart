import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/data.dart';
import 'package:provider/provider.dart';
import 'package:get_done/theme/themeprovider.dart';
import 'package:get_done/mainpages/todospages/edittodopage.dart';

class TodosPage extends StatefulWidget {
  const TodosPage({super.key});

  @override
  State<TodosPage> createState() => _TodosPageState();
}

class _TodosPageState extends State<TodosPage> {
  int anyTodosDisplayed = 0;

  @override
  Widget build(BuildContext context) {
    Color personalizedColor =
        Provider.of<ThemeProvider>(context, listen: false).personalizedColor;

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
              showDialog(
                      context: context,
                      builder: (context) => SetFilterAndSortAlert())
                  .then((_) => setState(
                        () {},
                      ));
            },
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.only(top: 20, right: 10, left: 10),
        child: Column(
          children: [
            Expanded(
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
                proxyDecorator: (child, index, animation) => Material(
                  borderRadius: BorderRadius.circular(15),
                  child: child,
                ),
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  // unpack todo data & project data
                  Map todo = todos[index];
                  String todoTitle = todo['todo_title'];
                  String todoDueDate = todo['todo_due_date'];
                  String todoPriority = todo['todo_priority'].toString();
                  bool todoIsDone = todo['todo_is_done'];
                  String todoIsDoneString = todoIsDone ? 'Done' : 'Undone';

                  int projectId = todo['project_id'];
                  Map project = projects[projectId]!;
                  Color projectColor = project['project_color'];
                  IconData projectIcon = project['project_icon'];

                  if (index == 0) {
                    anyTodosDisplayed = 0;
                  }

                  // check status filter
                  if (!selectedStatusFilters.contains(todoIsDoneString)) {
                    anyTodosDisplayed += 1;
                    return SizedBox.shrink(
                      key: ValueKey(index),
                    );
                  }

                  // check priority filter
                  if (!selectedPriorityFilters
                      .contains(todoPriority.toString())) {
                    anyTodosDisplayed += 1;
                    return SizedBox.shrink(
                      key: ValueKey(index),
                    );
                  }

                  // check project filter
                  if (!selectedProjectsId.contains(projectId)) {
                    anyTodosDisplayed += 1;
                    return SizedBox.shrink(
                      key: ValueKey(index),
                    );
                  }

                  return Dismissible(
                    key: ValueKey(index),
                    direction: DismissDirection.horizontal,
                    onDismissed: (direction) {
                      if (direction == DismissDirection.endToStart) {
                        setState(() {
                          todo['todo_is_done'] = true;
                        });
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${todo['title']} marked as done!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      } else if (direction == DismissDirection.startToEnd) {
                        //todo useful action
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('${todo['title']} deleted!'),
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
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
                      color: const Color.fromARGB(255, 60, 190, 65),
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
                      child: GestureDetector(
                        onTap: () {
                          Navigator.pop(
                            context,
                            MaterialPageRoute(
                              builder: (context) => EditTodoPage(),
                            ),
                          );
                        },
                        child: ListTile(
                          title: Text(
                            '$todoTitle [$todoPriority]',
                            style: TextStyle(
                              fontFamily: 'Poppins',
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          subtitle: Text(
                            todoDueDate,
                            style: TextStyle(
                                fontFamily: 'Poppins',
                                // fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Color.alphaBlend(
                                    personalizedColor.withValues(alpha: 0.1),
                                    Theme.of(context).colorScheme.secondary)),
                          ),
                          leading: Icon(
                            projectIcon,
                            color: projectColor,
                          ),
                          trailing: Transform.scale(
                            scale: 1.4,
                            child: Checkbox(
                              value: todoIsDone,
                              onChanged: (value) {
                                setState(() {
                                  todo['todo_is_done'] = value!;
                                });
                              },
                              shape: CircleBorder(),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SetFilterAndSortAlert extends StatefulWidget {
  const SetFilterAndSortAlert({super.key});

  @override
  State<SetFilterAndSortAlert> createState() => _SetFilterAndSortAlertState();
}

class _SetFilterAndSortAlertState extends State<SetFilterAndSortAlert> {
  @override
  Widget build(BuildContext context) {
    Color personalizedColor =
        Provider.of<ThemeProvider>(context).personalizedColor;

    return AlertDialog(
      title: GradientText(
        'Filter Todos',
        colors: [
          personalizedColor,
          personalizedColor.withValues(alpha: 0.5),
        ],
        style: TextStyle(fontWeight: FontWeight.w500, fontSize: 28),
      ),
      actions: [
        TextButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text(
            'Done',
            style: TextStyle(
                color: Theme.of(context).colorScheme.secondary,
                fontWeight: FontWeight.w500),
          ),
        ),
      ],
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Sort by:'),
            Wrap(
              spacing: 8.0,
              children: ['Date', 'Priority']
                  .map(
                    (sortOption) => ChoiceChip(
                      label: Text(sortOption),
                      selected: selectedSortOption == sortOption,
                      onSelected: (newValue) {
                        setState(() {
                          selectedSortOption = sortOption;
                          startSorting(sortOption);
                        });
                      },
                      showCheckmark: false,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text('Status:'),
            Wrap(
              spacing: 8.0,
              children: ['Done', 'Undone']
                  .map(
                    (statusFilterOption) => FilterChip(
                      label: Text(statusFilterOption),
                      selected:
                          selectedStatusFilters.contains(statusFilterOption),
                      onSelected: (isSelected) {
                        if (isSelected) {
                          setState(() {
                            selectedStatusFilters.add(statusFilterOption);
                          });
                        } else {
                          setState(() {
                            selectedStatusFilters.remove(statusFilterOption);
                          });
                        }
                      },
                      showCheckmark: false,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text('Priorities:'),
            Wrap(
              spacing: 8.0,
              children: ['0', '1', '2']
                  .map(
                    (priorityFilterOption) => FilterChip(
                      label: Text(priorityFilterOption),
                      selected: selectedPriorityFilters
                          .contains(priorityFilterOption),
                      onSelected: (isSelected) {
                        if (isSelected) {
                          setState(() {
                            selectedPriorityFilters.add(priorityFilterOption);
                          });
                        } else {
                          setState(() {
                            selectedPriorityFilters
                                .remove(priorityFilterOption);
                          });
                        }
                      },
                      showCheckmark: false,
                    ),
                  )
                  .toList(),
            ),
            SizedBox(height: 16.0),
            Text('Projects:'),
            Wrap(
              spacing: 8.0,
              children: projects.keys
                  .map(
                    (projectId) => FilterChip(
                      label: Text(projects[projectId]!['project_name']),
                      selected: selectedProjectsId.contains(projectId),
                      onSelected: (isSelected) {
                        if (isSelected) {
                          setState(() {
                            selectedProjectsId.add(projectId);
                          });
                        } else {
                          setState(() {
                            selectedProjectsId.remove(projectId);
                          });
                        }
                      },
                      showCheckmark: false,
                    ),
                  )
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}

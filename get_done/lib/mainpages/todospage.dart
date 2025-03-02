import 'package:flutter/material.dart';
import 'package:get_done/assets/todo_list_tile.dart';
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
  Set<int> selected = {0};

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
        width: double.infinity,
        child: Column(
          children: [
            SegmentedButton(
              segments: [
                ButtonSegment(value: 1, label: Text('List View')),
                ButtonSegment(value: 2, label: Text('Calender View')),
              ],
              selected: selected,
              onSelectionChanged: (p0) {
                setState(() {
                  selected = p0;
                });
              },
              showSelectedIcon: false,
            ),
            Expanded(
              child: filteredTodos.isEmpty
                  ? Text('Hallo TEST TEST')
                  : ReorderableListView.builder(
                      onReorder: (oldIndex, newIndex) {
                        setState(
                          () {
                            if (newIndex > oldIndex) {
                              newIndex -= 1;
                            }
                            final item = filteredTodos.removeAt(oldIndex);
                            filteredTodos.insert(newIndex, item);
                          },
                        );
                      },
                      itemCount: filteredTodos.length,
                      itemBuilder: (context, index) {
                        // unpack todo data & project data
                        Map todo = filteredTodos[index];
                        String todoTitle = todo['todo_title'];
                        String todoDueDate = todo['todo_due_date'];
                        String todoPriority = todo['todo_priority'].toString();
                        bool todoIsDone = todo['todo_is_done'];

                        int projectId = todo['project_id'];
                        Map project = projects[projectId]!;
                        Color projectColor = project['project_color'];
                        IconData projectIcon = project['project_icon'];

                        return GestureDetector(
                          key: ValueKey(index),
                          onTap: () {
                            Navigator.pop(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditTodoPage(),
                              ),
                            );
                          },
                          child: TodoListeTile(
                            title: todoTitle,
                            priority: todoPriority,
                            projectIcon: projectIcon,
                            projectColor: projectColor,
                            dueDate: todoDueDate,
                            isChecked: todoIsDone,
                            onChecked: (value) {
                              setState(() {
                                todo['todo_is_done'] = value;
                                filterTodos(todos);
                                startSorting(selectedSortOption,
                                    selectedSortDirectionOption);
                              });
                            },
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
        Provider.of<ThemeProvider>(context, listen: false).personalizedColor;

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
            startSorting(selectedSortOption, selectedSortDirectionOption);
            filterTodos(todos);
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
                        });
                      },
                      showCheckmark: false,
                    ),
                  )
                  .toList(),
            ),
            Wrap(
              spacing: 8.0,
              children: [
                [Icons.arrow_upward_rounded, 'acending'],
                [Icons.arrow_downward_rounded, 'decending']
              ]
                  .map(
                    (sortDirectionOptionList) => ChoiceChip(
                      label: Icon(sortDirectionOptionList[0] as IconData,
                          size: 20),
                      selected: selectedSortDirectionOption ==
                          sortDirectionOptionList[1],
                      onSelected: (newValue) {
                        setState(() {
                          selectedSortDirectionOption =
                              sortDirectionOptionList[1] as String;
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

import 'package:flutter/material.dart';

//. Todo Map

List<Map<String, dynamic>> todos = [
  //todo description
  {
    'todo_title': 'Einkaufen',
    'todo_due_date': '13.01.25',
    'todo_priority': 2,
    'todo_is_done': false,
    'project_id': 1,
  },
  {
    'todo_title': 'Putzen',
    'todo_due_date': '14.01.25',
    'todo_priority': 0,
    'todo_is_done': false,
    'project_id': 1,
  },
  {
    'todo_title': 'Finanzen',
    'todo_due_date': '30.01.25',
    'todo_priority': 1,
    'todo_is_done': false,
    'project_id': 0,
  },
];

// Projects Map

Map<int, Map<String, dynamic>> projects = {
  0: {
    'project_name': 'Haushalt',
    'project_color': const Color.fromARGB(255, 74, 177, 71),
    'project_icon': Icons.house_rounded,
  },
  1: {
    'project_name': 'Finanzen',
    'project_color': const Color.fromARGB(255, 30, 86, 151),
    'project_icon': Icons.attach_money_rounded,
  },
};

// Filtering and Sorting
String selectedSortOption = 'Date';
List<String> selectedStatusFilters = ['Done', 'Undone'];
List<String> selectedPriorityFilters = ['0', '1', '2'];
List selectedProjectsId =
    List.generate(projects.length, (int index) => index, growable: true);

void startSorting(sortOption) {
  if (sortOption == 'Date') {
    sortByDate();
  } else if (sortOption == 'Priority') {
    sortByPriority();
  }
  return;
}

void sortByDate({bool reversed = false}) {
  todos.sort((a, b) {
    String dateAString = a['todo_due_date'];
    String dateBString = b['todo_due_date'];

    DateTime dateA = DateTime.parse(
        '20${dateAString.substring(0, 2)}-${dateAString.substring(3, 5)}-${dateAString.substring(6, 8)}');
    DateTime dateB = DateTime.parse(
        '20${dateBString.substring(0, 2)}-${dateBString.substring(3, 5)}-${dateBString.substring(6, 8)}');

    return reversed ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
  });
}

void sortByPriority({bool reversed = false}) {
  todos.sort((a, b) {
    int prioA = a['todo_priority'];
    int prioB = b['todo_priority'];

    return reversed ? prioA.compareTo(prioB) : prioB.compareTo(prioA);
  });
}

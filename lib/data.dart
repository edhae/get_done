import 'package:flutter/material.dart';

// Todo Map

List<Map<String, dynamic>> todos = [
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
String selectedSortDirectionOption = 'decending';
List<String> selectedStatusFilters = ['Done', 'Undone'];
List<String> selectedPriorityFilters = ['0', '1', '2'];
List selectedProjectsId =
    List.generate(projects.length, (int index) => index, growable: true);


List<Map<String, dynamic>> filteredTodos = todos;

void filterTodos(todos) {
  filteredTodos = todos.where((todo) {
    // Retrieve todo's data
    String todoIsDoneString = todo['todo_is_done'] ? 'Done' : 'Undone';
    String todoPriority = todo['todo_priority'].toString();
    int projectId = todo['project_id'];

    // Check if the todo meets the filtering criteria
    bool statusMatches = selectedStatusFilters.contains(todoIsDoneString);
    bool priorityMatches = selectedPriorityFilters.contains(todoPriority);
    bool projectMatches = selectedProjectsId.contains(projectId);

    // Return true if the todo passes the filter, false otherwise
    return statusMatches && priorityMatches && projectMatches;
  }).toList();
}

void startSorting(sortOption, sortDirectionOption) {
  if (sortOption == 'Date') {
    sortByDate(reversed: sortDirectionOption == 'acending');
  } else if (sortOption == 'Priority') {
    sortByPriority(reversed: sortDirectionOption == 'decending');
  }
  return;
}

void sortByDate({bool reversed = false}) {
  todos.sort(
    (a, b) {
      String dateAString = a['todo_due_date'];
      String dateBString = b['todo_due_date'];

      DateTime dateA = DateTime.parse(
          '20${dateAString.substring(0, 2)}-${dateAString.substring(3, 5)}-${dateAString.substring(6, 8)}');
      DateTime dateB = DateTime.parse(
          '20${dateBString.substring(0, 2)}-${dateBString.substring(3, 5)}-${dateBString.substring(6, 8)}');

      return reversed ? dateB.compareTo(dateA) : dateA.compareTo(dateB);
    },
  );
}

void sortByPriority({bool reversed = false}) {
  todos.sort(
    (a, b) {
      int prioA = a['todo_priority'];
      int prioB = b['todo_priority'];
      return reversed ? prioA.compareTo(prioB) : prioB.compareTo(prioA);
    },
  );
}

// List<Map<String, dynamic>> groupByStatus({whatList = 'all'}) {
//   List<Map<String, dynamic>> doneTodos =
//       todos.where((todo) => todo['todo_is_done']).toList();
//   List<Map<String, dynamic>> undoneTodos =
//       todos.where((todo) => !todo['todo_is_done']).toList();
//   if (whatList == 'done') {
//     return doneTodos;
//   } else if (whatList == 'undone') {
//     return undoneTodos;
//   } else {
//     return todos = [...undoneTodos, ...doneTodos];
//   }
// }

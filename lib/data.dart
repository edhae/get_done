import 'package:flutter/material.dart';

//! TODO DATA

List<Map<String, dynamic>> todos = [
  //todo description
  {
    'todo_title': 'Einkaufen',
    'todo_due_date': '13.01.25',
    'todo_is_done': false,
    'project_id': 0,
  },
  {
    'todo_title': 'Putzen',
    'todo_due_date': '14.01.25',
    'todo_is_done': false,
    'project_id': 0,
  },
  {
    'todo_title': 'Einkaufen',
    'todo_due_date': '30.01.25',
    'todo_is_done': false,
    'project_id': 1,
  },
];

//! PROJECTS DATA

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

Map projectsNameToId = Map.fromEntries(
    projects.keys.map((id) => MapEntry(id, projects[id]!['project_name'])));
List projectsNames = projectsNameToId.values.toList();


//! FILTER AND SORT DATA

String selectedSortOption = 'Date';
String selectedStatus = 'Undone';
List selectedProjects = [0];


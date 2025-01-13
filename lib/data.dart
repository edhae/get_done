import 'package:flutter/material.dart';

List<Map<String, dynamic>> todos = [
  {
    'todo_title': 'Einkaufen',
    'todo_due_date': '12.01.25',
    'todo_is_done': false,
    'project_id': 0,
  },
  // {
  //   'title': 'Lernen',
  //   'due_date': '13.01.25',
  //   'done': false,
  //   'project_name': 'Schule',
  //   'project_color': const Color.fromARGB(165, 33, 149, 243),
  // },
  // {
  //   'title': 'Sport',
  //   'due_date': '16.01.25',
  //   'done': false,
  //   'project_name': 'Schule',
  //   'project_color': const Color.fromARGB(165, 33, 149, 243),
  // },
  // {
  //   'title': 'Rechnungen',
  //   'due_date': '01.02.25',
  //   'done': false,
  //   'project_name': 'Finanzen',
  //   'project_color': const Color.fromARGB(165, 63, 81, 181),
  // },
];

Map<int, Map<String, dynamic>> projects = {
  0: {
    'project_name': 'Haushalt',
    'project_color': const Color.fromARGB(255, 74, 177, 71),
    'project_icon': Icons.clean_hands,
  },
};

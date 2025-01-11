import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:get_done/theme/themedata.dart';
import 'package:get_done/data.dart';

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
          'Todos',
          colors: [
            personalizedColor,
            personalizedColor.withValues(alpha: 0.5),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(top: 15, left: 10, right: 10),
            decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              color: Theme.of(context).colorScheme.primary,
              boxShadow: [
                BoxShadow(
                  color: Color.alphaBlend(
                      personalizedColor.withValues(alpha: 0.17),
                      Theme.of(context).colorScheme.primary),
                  blurRadius: 6,
                  offset: Offset(2, 4),
                ),
              ],
            ),
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
          );
        },
      ),
    );
  }
}

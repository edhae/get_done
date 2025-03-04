import 'package:flutter/material.dart';

class TodoListeTile extends StatefulWidget {
  final String title;
  final String priority;
  final IconData projectIcon;
  final Color projectColor;
  final String dueDate;
  final bool isChecked;
  final ValueChanged<bool?> onChecked;

  const TodoListeTile({
    super.key,
    required this.title,
    required this.priority,
    required this.projectIcon,
    required this.projectColor,
    required this.dueDate,
    required this.isChecked,
    required this.onChecked,
  });

  @override
  State<TodoListeTile> createState() => _TodoListeTileState();
}

class _TodoListeTileState extends State<TodoListeTile> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Card(
        elevation: 2,
        margin: const EdgeInsets.symmetric(vertical: 3, horizontal: 4),
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: widget.projectColor,
            child: Icon(widget.projectIcon, color: Colors.grey.shade50),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              decoration: widget.isChecked ? TextDecoration.lineThrough : null,
              fontWeight: FontWeight.bold,
              color: widget.isChecked ? Colors.grey : null,
            ),
          ),
          subtitle: Row(
            children: [
              Text(
                widget.priority,
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  color: widget.priority == '0' ? Colors.red.shade200 : widget.priority == '1' ? Colors.red.shade300 : Colors.red.shade800,
                  fontSize: 15
                ),
              ),
              SizedBox(width: 20),
              Icon(Icons.calendar_today, size: 16, color: Colors.grey),
              SizedBox(width: 10),
              Text(widget.dueDate, style: TextStyle(fontStyle: FontStyle.italic)),
            ],
          ),
          trailing: Checkbox(
            value: widget.isChecked,
            onChanged: widget.onChecked,
            activeColor: widget.projectColor,
          ),
        ),
      ),
    );
  }
}

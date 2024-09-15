import 'package:flutter/material.dart';
import 'package:listo_to_do_list_app/constants/colors.dart';
import 'package:listo_to_do_list_app/model/todo_model.dart';

class TodoItem extends StatelessWidget {
  const TodoItem(
      {super.key,
      required this.todo,
      required this.onToDoChanged,
      required this.onDeleteItem});

  final TodoModel todo;
  final onToDoChanged;
  final onDeleteItem;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Colors.white,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: kMainBlue,
        ),
        title: Text(
          todo.todoText!,
          style: TextStyle(
            fontSize: 18,
            color: kSecondaryBlue,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
          ),
        ),
        trailing: Container(
          padding: EdgeInsets.zero,
          width: 35,
          height: 35,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: kMainRed,
          ),
          child: IconButton(
              color: Colors.white,
              onPressed: () {
                onDeleteItem(todo.id);
              },
              icon: const Icon(
                Icons.delete,
                color: Colors.white,
                size: 18,
              )),
        ),
      ),
    );
  }
}

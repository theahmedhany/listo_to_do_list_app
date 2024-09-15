import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:listo_to_do_list_app/constants/colors.dart';
import 'package:listo_to_do_list_app/model/todo_model.dart';
import 'package:listo_to_do_list_app/widgets/todo_item.dart';

class TodoItemList extends StatelessWidget {
  final List<TodoModel> foundToDo;
  final Function(TodoModel) onToDoChanged;
  final Function(String) onDeleteItem;

  const TodoItemList({
    Key? key,
    required this.foundToDo,
    required this.onToDoChanged,
    required this.onDeleteItem,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return foundToDo.isEmpty
        ? Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 200,
                  height: 200,
                  child: Image.asset('assets/images/nothing.png'),
                ),
                const SizedBox(height: 40),
                const Text(
                  'No To-Dos available.',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: kSecondaryBlue,
                  ),
                ),
                const Text(
                  'Please add a new one!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w400,
                    color: kSecondaryBlue,
                  ),
                ),
                const SizedBox(height: 50),
              ],
            ),
          )
        : ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Container(
                margin: const EdgeInsets.only(top: 50, bottom: 20),
                child: const Text(
                  'All To Dos',
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: kSecondaryBlue,
                  ),
                ),
              ),
              for (TodoModel todoo in foundToDo.reversed)
                TodoItem(
                  todo: todoo,
                  onToDoChanged: onToDoChanged,
                  onDeleteItem: onDeleteItem,
                ),
              const SizedBox(height: 70),
            ],
          );
  }
}

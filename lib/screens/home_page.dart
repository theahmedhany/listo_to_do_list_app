import 'package:flutter/material.dart';
import 'package:listo_to_do_list_app/constants/colors.dart';
import 'package:listo_to_do_list_app/model/todo_model.dart';
import 'package:listo_to_do_list_app/widgets/custom_search_bar.dart';
import 'package:listo_to_do_list_app/widgets/todo_item_list.dart';
import 'package:listo_to_do_list_app/widgets/add_todo_bar.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final todosList = TodoModel.todoList();
  final _todoController = TextEditingController();
  List<TodoModel> _foundToDo = [];

  @override
  void initState() {
    _foundToDo = todosList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kMainBackground,
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Column(
              children: [
                CustomSearchBar(onSearch: _runFilter),
                Expanded(
                  child: TodoItemList(
                    foundToDo: _foundToDo,
                    onToDoChanged: _handleToDoChanges,
                    onDeleteItem: _deleteToDoItem,
                  ),
                ),
              ],
            ),
          ),
          AddToDoBar(
            controller: _todoController,
            onAddPressed: () {
              _addToDoItem(_todoController.text);
            },
          ),
        ],
      ),
    );
  }

  void _handleToDoChanges(TodoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteToDoItem(String id) {
    setState(() {
      todosList.removeWhere((element) => element.id == id);
    });
  }

  void _addToDoItem(String toDo) {
    setState(() {
      todosList.add(TodoModel(
        id: DateTime.now().microsecondsSinceEpoch.toString(),
        todoText: toDo,
      ));
    });
    _todoController.clear();
  }

  void _runFilter(String enterKeyword) {
    List<TodoModel> results = [];
    if (enterKeyword.isEmpty) {
      results = todosList;
    } else {
      results = todosList
          .where((element) => element.todoText!
              .toLowerCase()
              .contains(enterKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      _foundToDo = results;
    });
  }

  AppBar _buildAppBar() {
    return AppBar(
      surfaceTintColor: Colors.transparent,
      backgroundColor: kMainBackground,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 45,
            width: 45,
            child: Image.asset('assets/images/logo.png'),
          ),
          Container(
            height: 45,
            width: 45,
            decoration: BoxDecoration(
              color: kMainBlue,
              borderRadius: BorderRadius.circular(100),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
            ),
          ),
        ],
      ),
      centerTitle: true,
    );
  }
}

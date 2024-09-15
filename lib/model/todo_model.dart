class TodoModel {
  String? id;
  String? todoText;
  bool isDone;

  TodoModel({
    required this.id,
    required this.todoText,
    this.isDone = false,
  });

  static List<TodoModel> todoList() {
    return [];
  }
}

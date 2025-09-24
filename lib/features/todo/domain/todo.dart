class Todo {
  final int id;
  final String description;
  final bool isCompleted;

  Todo({required this.id, required this.description, this.isCompleted = false});

  // to toggle isCompleted
  Todo toggleCompleted() {
    return Todo(id: id, description: description, isCompleted: !isCompleted);
  }
}

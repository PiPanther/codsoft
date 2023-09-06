class ToDo{
  String? id;
  String? textContent;
  bool isDone;

  ToDo({
    required this.id,
    required this.textContent,
    this.isDone = false
  });
}
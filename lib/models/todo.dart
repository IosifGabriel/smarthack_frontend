class Todo {
  String id;
  String text;

  Todo({
    this.id,
    this.text,
  });

  factory Todo.fromJson(Map<String, dynamic> item) {
    return Todo(
      id: item['id'],
      text: item['text'],
    );
  }
}

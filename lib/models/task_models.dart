class TaskModel{
  String id;
  String title;
  String description;
  DateTime date;
  bool isDone;


  TaskModel({required this.title,
  required this.description,
  required this.date,
  required this.id,
  this.isDone = false

  });
}
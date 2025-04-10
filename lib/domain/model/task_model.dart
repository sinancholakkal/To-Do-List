class TaskModel {
    final String title;
  final String description;
  final String date;
  final bool isCompleted;
  final String id;

  TaskModel({required this.title, required this.description, required this.date, required this.isCompleted, required this.id});

@override
  bool operator ==(Object other) =>
    identical(this, other) ||
    other is TaskModel &&
    runtimeType == other.runtimeType &&
    title == other.title &&
    description==other.description
    &&date==other.date&&
    isCompleted == other.isCompleted
    && id == other.id;

    @override
  List<Object?> get props => [title, description, date, isCompleted, id];

}

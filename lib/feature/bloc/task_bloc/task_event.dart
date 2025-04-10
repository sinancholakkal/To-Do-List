part of 'task_bloc.dart';

@immutable
sealed class TaskEvent {}

class TaskAddEvent extends TaskEvent {
  final TaskModel taskModel;
  TaskAddEvent({required this.taskModel});
}
class TaskAllGetEvent extends TaskEvent {}
class TaskUpdateEvent extends TaskEvent{
  final TaskModel taskModel;
  TaskUpdateEvent({required this.taskModel});
}
class TaskIsCompletedUdateEvent extends TaskEvent{
  final bool isCompleted;
  final String id;
  TaskIsCompletedUdateEvent({required this.isCompleted,required this.id});
}
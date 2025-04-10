part of 'task_bloc.dart';

@immutable
sealed class TaskState {}

final class TaskInitial extends TaskState {}
class TaskAddedState extends TaskState{}
class TaskGetLoadingState extends TaskState{}
class TaskAllGetSuccessState extends TaskState{
  final List<TaskModel>taskModel;
    final int pendingCount;
  final int completedCount;
  TaskAllGetSuccessState({required this.taskModel,required this.pendingCount,required this.completedCount});
}
class TaskUpdatedState extends TaskState{}
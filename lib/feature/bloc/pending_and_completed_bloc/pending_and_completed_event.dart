part of 'pending_and_completed_bloc.dart';

@immutable
sealed class PendingAndCompletedEvent {}
class CountInitialEvent extends PendingAndCompletedEvent{
  final int pendingCount;
  final int completedCount;
  final int taskLength;
  CountInitialEvent({required this.pendingCount,required this.completedCount,required this.taskLength});
}
part of 'pending_and_completed_bloc.dart';

@immutable
sealed class PendingAndCompletedState {}

final class PendingAndCompletedInitial extends PendingAndCompletedState {}
class CountLoadedState extends PendingAndCompletedState{
  final int pendingCount;
  final int completedCount;
  CountLoadedState({required this.pendingCount,required this.completedCount});
}
part of 'search_bloc.dart';

sealed class SearchState extends Equatable {
  const SearchState();
  
  @override
  List<Object> get props => [];
}

final class SearchInitial extends SearchState {}
class SearchLoadingState extends SearchState{}
class SearchLoadedState extends SearchState{
  final List<TaskModel>taskModels;
  const SearchLoadedState({required this.taskModels});
}
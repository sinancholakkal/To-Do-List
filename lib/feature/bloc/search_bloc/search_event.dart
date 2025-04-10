part of 'search_bloc.dart';

sealed class SearchEvent extends Equatable {
  const SearchEvent();

  @override
  List<Object> get props => [];
}
class SearchQueryEvent extends SearchEvent{
  final String query;
  const SearchQueryEvent({required this.query});
}
class SearchInitialEvent extends SearchEvent{}
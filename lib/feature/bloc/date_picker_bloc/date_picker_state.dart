part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerState {}

final class DatePickerInitial extends DatePickerState {}
class DateLoadedState extends DatePickerState{
  final String date;
  DateLoadedState({required this.date});
}
class DateResetState extends DatePickerState{}
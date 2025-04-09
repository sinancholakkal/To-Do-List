part of 'date_picker_bloc.dart';

@immutable
sealed class DatePickerEvent {}
class DateSelectEvent extends DatePickerEvent{
 final BuildContext context;
 DateSelectEvent({required this.context});
}
class DateResetEvent extends DatePickerEvent{}
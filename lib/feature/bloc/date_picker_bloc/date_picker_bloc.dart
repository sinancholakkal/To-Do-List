import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:meta/meta.dart';

part 'date_picker_event.dart';
part 'date_picker_state.dart';

class DatePickerBloc extends Bloc<DatePickerEvent, DatePickerState> {
  DatePickerBloc() : super(DatePickerInitial()) {
   on<DateSelectEvent>((event, emit)async {
      final DateTime? picked =await showDatePicker(context: event.context, firstDate: DateTime(2025), lastDate: DateTime(2100),initialDate: DateTime.now());
      log(picked.toString());
      if(picked!=null){
        final String formattedDate = DateFormat('dd-MM-yyyy').format(picked);
        emit(DateLoadedState(date: formattedDate));
        
      }else{
        emit(DatePickerInitial());
      }
    });
    on<DateResetEvent>((event, emit)async {
      emit(DateResetState());
    });
  }
}

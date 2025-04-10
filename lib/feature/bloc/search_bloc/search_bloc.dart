import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/domain/repository/task_search_services.dart';

part 'search_event.dart';
part 'search_state.dart';

class SearchBloc extends Bloc<SearchEvent, SearchState> {
  SearchBloc() : super(SearchInitial()) {
    on<SearchQueryEvent>((event, emit) async{
      emit(SearchLoadingState());
      try{
        List<TaskModel> taskModels = await TaskSearchServices.taskSearchQuery(query: event.query);
        emit(SearchLoadedState(taskModels: taskModels));
      }catch(e){
        log("Somthing issue while searching task $e");
      }
    });
    on<SearchInitialEvent>((event, emit) async{
      emit(SearchInitial());
      
    });
  }
}

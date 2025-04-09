
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/domain/repository/task_services.dart';

part 'task_event.dart';
part 'task_state.dart';

class TaskBloc extends Bloc<TaskEvent, TaskState> {
  TaskBloc() : super(TaskInitial()) {
    on<TaskAddEvent>((event, emit)async {
      try{
        await TaskServices.taskAdding(taskModel: event.taskModel);
        emit(TaskAddedState());
        log("New Task Added");
      }catch(e){
        log("something issue while adding new task $e");
      }
    });

    on<TaskAllGetEvent>((event, emit)async {
      emit(TaskGetLoadingState());
      try{
          int pendingCount =0;
  int completedCount=0;
        final taskModels = await TaskServices.getAllTaskes();
        for(var taskModel in taskModels){
          if(taskModel.isCompleted==false){
            pendingCount++;
          }else{
            completedCount++;
          }
        }
        emit(TaskAllGetSuccessState(taskModel: taskModels,pendingCount: pendingCount,completedCount: completedCount));
        log("New Task Added");
      }catch(e){
        log("something issue while adding new task $e");
      }
    });
  }
}

import 'dart:developer';

import 'package:to_do_list/domain/model/task_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class TaskServices {
  static Future<void>taskAdding({required TaskModel taskModel})async{
    final firestore = FirebaseFirestore.instance;
    firestore.collection("task")
    .doc(taskModel.id)
    .set({
      "title": taskModel.title,
      "description":taskModel.description,
      "date":taskModel.date,
      "isCompleted":taskModel.isCompleted,
      "id":taskModel.id
    });
  }
  static Future<List<TaskModel>>getAllTaskes()async{
     final firestore = FirebaseFirestore.instance;
    final docs =  await firestore.collection("task").get();
    List<TaskModel>taskModels =[];
    for(var doc in docs.docs){
      final data = doc.data();
      TaskModel taskModel = TaskModel(title: data['title'], description: data['description'], date: data['date'], isCompleted: data["isCompleted"], id: data['id']);
      if(taskModel.isCompleted==true){
        taskModels.add(taskModel);
      }else{
        taskModels.insert(0, taskModel);
      }
    }
    return taskModels;
  }
}
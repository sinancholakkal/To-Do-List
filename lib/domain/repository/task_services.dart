import 'dart:developer';

import 'package:intl/intl.dart';
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
    String date ="dd";
    List<TaskModel>taskModels =[];
    for(var doc in docs.docs){
      final data = doc.data();
      DateTime now = DateTime.now();
    DateFormat formatter = DateFormat("dd-MM-yyyy");
    DateTime inputDate = formatter.parse(data['date']);
     DateTime today = DateTime(now.year, now.month, now.day);
     if (inputDate.isBefore(today)) {

      date ="Due: ${data['date']}";
     
    print("Date is in the past");
  } else if (inputDate.isAfter(today)) {
    print("Date is in the future");
    date = data['date'];
  } else {
     date = data['date'];
    print("Date is today");
  }


      TaskModel taskModel = TaskModel(title: data['title'], description: data['description'], date: date, isCompleted: data["isCompleted"], id: data['id']);
      if(taskModel.isCompleted==true){
        taskModels.add(taskModel);
      }else{
        taskModels.insert(0, taskModel);
      }
    }
    return taskModels;
  }

  static Future<void>taskUpdate({required TaskModel taskModel})async{
    final firestore = FirebaseFirestore.instance;
    await firestore
    .collection('task')
    .doc(taskModel.id).update({
      "title": taskModel.title,
      "description":taskModel.description,
      "date":taskModel.date,
     // "isCompleted":taskModel.isCompleted,
      // "id":taskModel.id
    });
  }
    static Future<void>taskIsCompletedUpdate({required bool isCompleted,required String id})async{
    final firestore = FirebaseFirestore.instance;
    await firestore
    .collection('task')
    .doc(id).update({
     "isCompleted":isCompleted,
      // "id":taskModel.id
    });
  }

   static Future<void>taskDelete({required String id})async{
    final firestore = FirebaseFirestore.instance;
    await firestore
    .collection('task')
    .doc(id).delete();
  }
  void dateCompare(String date){
    
  }
}
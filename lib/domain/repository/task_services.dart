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
}
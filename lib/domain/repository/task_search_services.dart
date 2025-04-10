import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:to_do_list/domain/model/task_model.dart';

class TaskSearchServices {
  static Future<List<TaskModel>> taskSearchQuery({required String query}) async {
    final firestore = FirebaseFirestore.instance;
    final docs = await firestore.collection("task").get();
    String date = "dd";
    List<TaskModel> taskModels = [];
    for (var doc in docs.docs) {
      final data = doc.data();
      if (data['title'].toLowerCase().contains(query) || data['description'].toLowerCase().contains(query)) {
        DateTime now = DateTime.now();
        DateFormat formatter = DateFormat("dd-MM-yyyy");
        DateTime inputDate = formatter.parse(data['date']);
        DateTime today = DateTime(now.year, now.month, now.day);
        if (inputDate.isBefore(today)) {
          date = "Due: ${data['date']}";

          print("Date is in the past");
        } else if (inputDate.isAfter(today)) {
          print("Date is in the future");
          date = data['date'];
        } else {
          date = data['date'];
          print("Date is today");
        }

        TaskModel taskModel = TaskModel(
          title: data['title'],
          description: data['description'],
          date: date,
          isCompleted: data["isCompleted"],
          id: data['id'],
        );
        if (taskModel.isCompleted == true) {
          taskModels.add(taskModel);
        } else {
          taskModels.insert(0, taskModel);
        }
      }
    }
    return taskModels;
  }
}

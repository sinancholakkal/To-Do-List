import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/sections/task_add_dialog_section.dart';
import 'package:to_do_list/feature/presentation/widgets/alert_dialog.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class TaskCardWidget extends StatelessWidget {
  TaskCardWidget({
    super.key,
    required this.index,
    required this.onToggle,
    required this.taskModel,
    required this.taskCompletionStates,
  });
  ValueNotifier<List<bool>> taskCompletionStates;
  final int index;
  final VoidCallback onToggle;
  final TaskModel taskModel;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: taskCompletionStates,
      builder: (context, completionList, child) {
        bool isCompleted = completionList[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: 72),
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color(0xFF262626),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Center(
                child: ListTile(
                  leading: GestureDetector(
                    onTap: onToggle,
                    child:
                        isCompleted
                            ? Icon(Icons.check_circle, color: Color(0xFF1E6F9F))
                            : Container(
                              width: 18,
                              height: 18,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                border: Border.all(color: kwhite, width: 1.5),
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                  ),
                  //Task view ontap----------
                  title: GestureDetector(
                    onTap: () {
                      log("Task viewed");
                      taskAddDialogSection(
                        type: TaskAddDialogType.forRead,
                        context: context,
                        titleController: TextEditingController(
                          text: taskModel.title,
                        ),
                        descriptionController: TextEditingController(
                          text: taskModel.description,
                        ),
                        dateController: TextEditingController(
                          text: taskModel.date,
                        ),
                      );
                    },
                    //Title section------
                    child: TextWidget(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      text: taskModel.title,
                      size: 21,
                      color: isCompleted ? Color(0xFF808080) : kwhite,
                      decoration:
                          isCompleted ? TextDecoration.lineThrough : null,
                      decorationThickness: 2,
                      decorationColor: Color(0xFF808080),
                    ),
                  ),
                  //Task view ontap----------
                  subtitle: GestureDetector(
                    onTap: () {
                      log("Task viewed");
                      taskAddDialogSection(
                        type: TaskAddDialogType.forRead,
                        context: context,
                        titleController: TextEditingController(
                          text: taskModel.title,
                        ),
                        descriptionController: TextEditingController(
                          text: taskModel.description,
                        ),
                        dateController: TextEditingController(
                          text: taskModel.date,
                        ),
                      );
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        //Desscription setion-----------
                        TextWidget(
                          text: taskModel.description,
                          color: Color(0xFF808080),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          decoration:
                              isCompleted ? TextDecoration.lineThrough : null,
                          decorationThickness: 2,
                          decorationColor: Color(0xFF808080),
                        ),
                        //Due date---------------
                        TextWidget(
                          text: taskModel.date.startsWith("Due")?taskModel.date:"Due: ${taskModel.date}",
                          color: (taskModel.date.startsWith("Due")&&taskModel.isCompleted==false)?Colors.red:Colors.white60,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          decoration:
                              isCompleted ? TextDecoration.lineThrough : null,
                          decorationThickness: 2,
                          decorationColor: Color(0xFF808080),
                        ),
                      ],
                    ),
                  ),
                  trailing: Row(
                    spacing: 5,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //Edit button----------------------
                      InkWell(
                        onTap: () {
                          taskAddDialogSection(
                            taskModel: taskModel,
                            context: context,
                            titleController: TextEditingController(
                              text: taskModel.title,
                            ),
                            descriptionController: TextEditingController(
                              text: taskModel.description,
                            ),
                            dateController: TextEditingController(
                              text: taskModel.date,
                            ),
                            type: TaskAddDialogType.forEdit,
                            isCompleted: completionList[index],
                            id: taskModel.id,
                          );
                        },
                        child: Image.asset(height: 20, "assets/edit.png"),
                      ),
                      //Delete button-----------------------------
                      InkWell(
                        onTap: () {
                          alertDialog(context: context, id: taskModel.id);
                        },
                        child: Image.asset(height: 20, "assets/delete.png"),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

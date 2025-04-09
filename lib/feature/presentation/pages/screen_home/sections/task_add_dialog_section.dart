import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/core/until/validation.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/feature/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/data/random_id.dart';
import 'package:to_do_list/feature/presentation/widgets/text_form_field_widget.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

Future<dynamic> taskAddDialogSection({
  required BuildContext context,
  required TextEditingController titleController,
  required TextEditingController descriptionController,
  required TextEditingController dateController,
  required TaskAddDialogType type,
}) {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) {
      return Form(
        key: _key,
        child: BlocListener<TaskBloc, TaskState>(
          listener: (context, state) {
            if(state is TaskAddedState){
              Navigator.pop(context);
              log("New Task dialog poped");
            }
          },
          child: Dialog(
            backgroundColor: Colors.transparent,
            insetPadding: EdgeInsets.zero,
            child: Container(
              width: double.infinity,
              // height: 300,
              decoration: BoxDecoration(
                color: Color(0xFF262626),
                borderRadius: BorderRadius.circular(16),
              ),
              child: Padding(
                padding: const EdgeInsets.all(25),
                child: Column(
                  spacing: 12,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextWidget(
                      text: "Add Task",
                      color: kwhite,
                      fontWeight: FontWeight.w700,
                      size: 20,
                    ),
                    //Title field----------------
                    TextFormFieldWidget(
                      validator: (value) {
                        return Validation.titleValidation(value);
                      },
                      controller: titleController,
                      labelText: "Title",
                      borderColor: Color(0xFF979797),
                      height: 1,
                    ),
                    //Description field------------
                    TextFormFieldWidget(
                      maxLine: 5,
                      validator: (value) {
                        return Validation.descriptionValidation(value);
                      },
                      controller: descriptionController,
                      labelText: "Description...",
                      borderColor: Color(0xFF979797),
                      height: 1,
                    ),
                    //Due date field---------------
                    BlocBuilder<DatePickerBloc, DatePickerState>(
                      builder: (context, state) {
                        if (state is DateLoadedState) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            dateController.text = state.date;
                          });
                        } else if (state is DateResetState) {
                          WidgetsBinding.instance.addPostFrameCallback((_) {
                            dateController.text = "";
                          });
                        }
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: TextFormField(
                            readOnly: true,
                            style: TextStyle(color: kwhite),
                            validator:
                                (value) => Validation.dateValidation(value),
                            controller: dateController,
                            decoration: InputDecoration(
                              label: TextWidget(text: "Due date"),
                              suffixIcon: InkWell(
                                onTap: () {
                                  context.read<DatePickerBloc>().add(
                                    DateSelectEvent(context: context),
                                  );
                                },
                                child: Icon(Icons.date_range, color: kwhite),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 15),
                    InkWell(
                      onTap: () {
                        if (_key.currentState!.validate()) {
                          log("Field validated");
                          final TaskModel taskModel = TaskModel(
                            title: titleController.text.trim(),
                            description: descriptionController.text.trim(),
                            date: dateController.text.trim(),
                            isCompleted: false,
                            id: getRandomId(),
                          );
                          context.read<TaskBloc>().add(
                            TaskAddEvent(taskModel: taskModel),
                          );
                        } else {
                          log("Field not validated");
                        }
                      },
                      child: Align(
                        alignment: Alignment.bottomRight,
                        child: InkWell(
                          child: Image.asset(height: 30, "assets/submitt.png"),
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    },
  ).then((_) {
    titleController.clear();
    descriptionController.clear();
    dateController.clear();
    context.read<DatePickerBloc>().add(DateResetEvent());
  });
}

enum TaskAddDialogType { forEdit, forAdd }

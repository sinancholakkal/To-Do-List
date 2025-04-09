import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/feature/bloc/pending_and_completed_bloc/pending_and_completed_bloc.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/sections/pending_and_complete_section.dart';
import 'package:to_do_list/feature/presentation/widgets/task_card_widget.dart';

class ListDisplaySection extends StatefulWidget {
  const ListDisplaySection({super.key});

  @override
  State<ListDisplaySection> createState() => _ListDisplaySectionState();
}

class _ListDisplaySectionState extends State<ListDisplaySection> {
  List<bool> taskCompletionStates = [];


  @override
  void initState() {
    context.read<TaskBloc>().add(TaskAllGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: Container(width: double.infinity, color: bgTop),
        ),
        Expanded(
          child: Container(
            width: double.infinity,
            color: bgBottom,
            padding: EdgeInsets.only(top: 96, left: 28, right: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Pending and completed section-----
                PendingAndCompletedSection(),
                Expanded(
                  child: BlocBuilder<TaskBloc, TaskState>(
                    builder: (context, state) {
                      List<TaskModel> taskModels = [];
                      if (state is TaskGetLoadingState) {
                        return Center(child: CircularProgressIndicator());
                      } else if (state is TaskAllGetSuccessState) {
                        taskModels = state.taskModel;
                        context.read<PendingAndCompletedBloc>().add(CountInitialEvent(pendingCount: state.pendingCount, completedCount: state.completedCount));
                      }
                      if (taskModels.isEmpty) {
                        
                        return Center(child: Text("No task yet"));
                      } else {
                        return ListView.builder(
                          physics: BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            taskCompletionStates.add(taskModels[index].isCompleted);
                            return TaskCardWidget(
                              isCompleted: taskCompletionStates[index],
                              taskModel: taskModels[index],
                              onToggle: () {
                                log("Toggle changed");
                                setState(() {
                                  taskCompletionStates[index] =
                                      !taskCompletionStates[index];
                                      log(taskCompletionStates[index].toString());
                                });
                              },
                            );
                          },
                          itemCount: taskModels.length,
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

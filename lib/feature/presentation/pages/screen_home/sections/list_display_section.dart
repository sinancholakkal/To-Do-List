import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/domain/model/task_model.dart';
import 'package:to_do_list/feature/bloc/pending_and_completed_bloc/pending_and_completed_bloc.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/sections/pending_and_complete_section.dart';
import 'package:to_do_list/feature/presentation/widgets/circular_widget.dart';
import 'package:to_do_list/feature/presentation/widgets/task_card_widget.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class ListDisplaySection extends StatefulWidget {
  const ListDisplaySection({super.key});

  @override
  State<ListDisplaySection> createState() => _ListDisplaySectionState();
}

class _ListDisplaySectionState extends State<ListDisplaySection> {
  ValueNotifier<List<bool>> taskCompletionStates = ValueNotifier([]);

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
                        return CircularWidget();
                      } else if (state is TaskAllGetSuccessState) {
                        taskModels = state.taskModel;
                        taskCompletionStates.value =
                            taskModels.map((e) => e.isCompleted).toList();
                        context.read<PendingAndCompletedBloc>().add(
                          CountInitialEvent(
                            pendingCount: state.pendingCount,
                            completedCount: state.completedCount,
                            taskLength: state.taskModel.length
                          ),
                        );
                      }
                      if (taskModels.isEmpty) {
                        return Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(height: 66,),
                            Image.asset("assets/empty.png",width: 56,height: 56,),
                            SizedBox(height: 20,),
                            TextWidget(text: "You don’t have any tasks yet.",size: 16,color: Color(0xFF808080),fontWeight: FontWeight.w700,),
                            TextWidget(text: "Start adding tasks and manage your\n time effectively.",size: 16,color: Color(0xFF808080),textAlign: TextAlign.center,)
                          ],
                        );
                      } else {
                        return ValueListenableBuilder(
                          valueListenable: taskCompletionStates,
                          builder: (context, completionList, child) {
                            return ListView.builder(
                              physics: BouncingScrollPhysics(),
                              itemBuilder: (context, index) {
                                //Calling task card------------------
                                return TaskCardWidget(
                                  taskCompletionStates: taskCompletionStates,
                                  index: index,
                                  taskModel: taskModels[index],
                                  onToggle: () {
                                    log("Toggle changed");
                                    final updatedList = List<bool>.from(
                                      taskCompletionStates.value,
                                    );
                                    context.read<TaskBloc>().add(TaskIsCompletedUdateEvent(isCompleted: !updatedList[index], id: taskModels[index].id));
                                    updatedList[index] = !updatedList[index];
                                    taskCompletionStates.value = updatedList;
                                    log(
                                      taskCompletionStates.value[index]
                                          .toString(),
                                    );
                                    final pState =
                                        context
                                            .read<PendingAndCompletedBloc>()
                                            .state;
                                    if (pState is CountLoadedState) {
                                      log(pState.pendingCount.toString());
                                      log(pState.completedCount.toString());
                                      if (completionList[index] == false) {
                                        log("Counter initial called");
                                        context
                                            .read<PendingAndCompletedBloc>()
                                            .add(
                                              CountInitialEvent(
                                                taskLength: pState.taskLength,
                                                pendingCount:
                                                    pState.pendingCount - 1,
                                                completedCount:
                                                    pState.completedCount + 1,
                                              ),
                                            );
                                      } else {
                                        context
                                            .read<PendingAndCompletedBloc>()
                                            .add(
                                              CountInitialEvent(
                                                taskLength: pState.taskLength,
                                                pendingCount:
                                                    pState.pendingCount + 1,
                                                completedCount:
                                                    pState.completedCount - 1,
                                              ),
                                            );
                                      }
                                    }
                                  },
                                );
                              },
                              itemCount: taskModels.length,
                            );
                          },
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

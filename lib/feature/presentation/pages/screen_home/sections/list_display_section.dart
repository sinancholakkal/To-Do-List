import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
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
                PendingAndCompletedSection(),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      taskCompletionStates.add(false);
                      return TaskCardWidget(
                        isCompleted: taskCompletionStates[index],
                        onToggle: () {
                          setState(() {
                            taskCompletionStates[index] =
                                !taskCompletionStates[index];
                          });
                        },
                      );
                    },
                    itemCount: 10,
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


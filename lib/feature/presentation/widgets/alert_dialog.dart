import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/widgets/flutter_toast.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

Future<dynamic> alertDialog({
  required BuildContext context,
  required String id,
}) {
  return showDialog(
    context: context,
    builder: (context) {
      return BlocListener<TaskBloc, TaskState>(
        listener: (context, state) {
          if (state is TaskDeletedState) {
            context.read<TaskBloc>().add(TaskAllGetEvent());
            flutterToast(msg: "Task successfully deleted");
            Navigator.pop(context);
          }
        },
        child: AlertDialog(
          backgroundColor: Color(0xFF262626),
          content: TextWidget(text: "Are you sure?", color: kwhite),
          title: TextWidget(text: "Delete task?", color: kwhite),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: TextWidget(text: "No"),
            ),
            TextButton(
              onPressed: () {
                context.read<TaskBloc>().add(TaskDeleteEvent(id: id));
              },
              child: TextWidget(text: "Yes"),
            ),
          ],
        ),
      );
    },
  );
}


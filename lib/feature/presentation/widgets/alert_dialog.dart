import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

Future<dynamic> alertDialog(BuildContext context) {
  return showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        backgroundColor: Color(0xFF262626),
        content: TextWidget(text: "Are you sure?", color: kwhite),
        title: TextWidget(text: "Delete task?", color: kwhite),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: TextWidget(text: "No"),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: TextWidget(text: "Yes"),
          ),
        ],
      );
    },
  );
}

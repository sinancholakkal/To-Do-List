import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class TaskCardWidget extends StatelessWidget {
  const TaskCardWidget({
    super.key,
    required this.isCompleted,
    required this.onToggle,
  });

  final bool isCompleted;
  final VoidCallback onToggle;

  @override
  Widget build(BuildContext context) {
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
              title: TextWidget(
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                text: "Do Math Homework",
                size: 21,
                color: isCompleted ? Color(0xFF808080) : kwhite,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
                decorationThickness: 2,
                decorationColor: Color(0xFF808080),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  TextWidget(
                    text:
                        "I have to complete math homework and draw a simple circle using pencil",
                    color: Color(0xFF808080),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    decoration: isCompleted ? TextDecoration.lineThrough : null,
                    decorationThickness: 2,
                    decorationColor: Color(0xFF808080),
                  ),
                  TextWidget(
                    text: "Due date: 09-March-2025",
                    color: Colors.white60,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
              trailing: Row(
                spacing: 5,
                mainAxisSize: MainAxisSize.min,
                children: [
                  InkWell(child: Image.asset(height: 20, "assets/edit.png")),
                  InkWell(child: Image.asset(height: 20, "assets/delete.png")),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

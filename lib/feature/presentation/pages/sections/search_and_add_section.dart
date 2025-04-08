import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/pages/sections/task_add_dialog_section.dart';
import 'package:to_do_list/feature/presentation/widgets/text_form_field_widget.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class SearchAndAddSection extends StatefulWidget {
  const SearchAndAddSection({super.key});

  @override
  State<SearchAndAddSection> createState() => _SearchAndAddSectionState();
}

class _SearchAndAddSectionState extends State<SearchAndAddSection> {
  late TextEditingController titleController;
  late TextEditingController descriptionController;
  late TextEditingController dateController;
  @override
  void initState() {
    titleController = TextEditingController(text: "Helloooo");
    descriptionController = TextEditingController();
    dateController = TextEditingController();
    super.initState();
  }
  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    dateController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 173,
      left: 22,
      right: 0,
      child: Row(
        children: [
          Flexible(
            //Search field widget
            child: TextFormFieldWidget(
              labelText: "🚀 Search...",
              borderColor: Color(0xFF0D0D0D),
            ),
          ),
          InkWell(
            onTap: () {
              //Calling dialog for entering new task------------
              taskAddDialogSection(context: context,dateController: dateController,descriptionController: descriptionController,titleController:titleController);
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: 84,
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color(0xFF1E6F9F),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  spacing: 6,
                  children: [
                    TextWidget(
                      text: "Add",
                      size: 14,
                      fontWeight: FontWeight.w700,
                      color: kwhite,
                    ),
                    Icon(Icons.add_circle_outline, color: kwhite, size: 18),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
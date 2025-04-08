import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/core/until/validation.dart';
import 'package:to_do_list/feature/presentation/widgets/text_form_field_widget.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

Future<dynamic> taskAddDialogSection({
  required BuildContext context,
  required TextEditingController titleController,
  required descriptionController,
  required TextEditingController dateController,
}) {
  GlobalKey<FormState> _key = GlobalKey<FormState>();
  return showDialog(
    context: context,
    builder: (context) {
      return Form(
        key: _key,
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
                    validator: (value){
                      return Validation.descriptionValidation(value);
                      
                    },
                    controller: descriptionController,
                    labelText: "Description...",
                    borderColor: Color(0xFF979797),
                    height: 1,
                  ),
                  //Due date field---------------
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: TextFormField(
                      validator: (value) => Validation.dateValidation(value),
                      controller: dateController,
                      decoration: InputDecoration(
                        
                        label: TextWidget(text: "Due date"),
                        suffixIcon: InkWell(
                          onTap: () {},
                          child: Icon(Icons.date_range, color: kwhite),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                  InkWell(
                    onTap: () {
                      if (_key.currentState!.validate()) {
                        log("Field validated");
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
      );
    },
  );
}

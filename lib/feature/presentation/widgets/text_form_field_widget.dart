
import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';

class TextFormFieldWidget extends StatelessWidget {
   TextFormFieldWidget({
    super.key,
    required this.labelText,
    this.borderColor,
    this.height,
    this.controller,
    this.validator,
    this.maxLine,
    this.readOnly
  });
  final String labelText;
  final Color? borderColor;
  final double? height;
  final TextEditingController? controller;
  String? Function(String?)? validator;
  final int? maxLine;
  final bool? readOnly;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: readOnly??false,
      maxLines: maxLine,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      controller: controller,
      validator: validator,
      style: TextStyle(color: kwhite, height: height),
      decoration: InputDecoration(
        label: Text(labelText),
        filled: true,
        fillColor: Color(0xFF262626),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? kwhite),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? kwhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor ?? kwhite),
        ),
      ),
    );
  }
}

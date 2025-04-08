import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.color,
    this.size,
    this.fontWeight,
    required this.text
  });
  final String text;
  final Color? color;
  final double? size;
final FontWeight? fontWeight;
  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      color :color,fontSize: size,fontWeight: fontWeight
    ),);
  }
}

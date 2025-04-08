import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    this.color,
    this.size,
    this.fontWeight,
    required this.text,
    this.maxLines,
    this.overflow,
    this.decoration,
    this.decorationColor,
    this.decorationThickness
  });
  final String text;
  final Color? color;
  final double? size;
  final FontWeight? fontWeight;
  final int? maxLines;
  final TextOverflow? overflow;
  final TextDecoration? decoration;
  final Color? decorationColor;
  final double? decorationThickness;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: decoration,
        decorationColor: decorationColor,
        decorationThickness: decorationThickness,
        overflow: overflow,
        color: color,
        fontSize: size,
        fontWeight: fontWeight,
      ),
      maxLines: maxLines,
    );
  }
}

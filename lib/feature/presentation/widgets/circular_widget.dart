
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';

class CircularWidget extends StatelessWidget {
  final double top;
  const CircularWidget({super.key,this.top = 300});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(
        color: kwhite,
        strokeWidth: 1.5,
      ),
    );
  }
}

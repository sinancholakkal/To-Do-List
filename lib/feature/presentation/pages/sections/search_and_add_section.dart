import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class SearchAndAddSection extends StatelessWidget {
  const SearchAndAddSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 173,
      left: 22,
      right: 0,
      child: Row(
        children: [
          Flexible(
            child: TextFormField(
              style: TextStyle(color: kwhite),
              decoration: InputDecoration(
                label: Text("🚀 Search..."),
                filled: true,
                fillColor: Color(0xFF262626),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF0D0D0D)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF0D0D0D)),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: Color(0xFF0D0D0D)),
                ),
              ),
            ),
          ),
          Padding(
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
                  TextWidget(text: "Add",size: 14,fontWeight: FontWeight.w700,color: kwhite,),
                  Icon(Icons.add_circle_outline,color: kwhite,size: 18,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}


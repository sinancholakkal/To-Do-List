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
            //Search field widget
            child: TextFormFieldWidget(labelText: "🚀 Search...",borderColor: Color(0xFF0D0D0D),),
          ),
          InkWell(
            onTap: () {
              showDialog(context: context, builder: (context) {
                return Dialog(
                  backgroundColor: Colors.transparent,
          insetPadding: EdgeInsets.zero,
                  child: Container(
                    width: double.infinity,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Color(0xFF262626),
                      borderRadius: BorderRadius.circular(16)
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(25),
                      child: Column(
                        spacing: 8,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          TextWidget(text: "Add Task",color: kwhite,fontWeight: FontWeight.w700,size: 20,),
                          TextFormFieldWidget(labelText: "Tittle",borderColor: Color(0xFF979797),height: 1,)
                        ],
                      ),
                    ),
                  ),
                );
              },);
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
                    TextWidget(text: "Add",size: 14,fontWeight: FontWeight.w700,color: kwhite,),
                    Icon(Icons.add_circle_outline,color: kwhite,size: 18,)
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

class TextFormFieldWidget extends StatelessWidget {
  const TextFormFieldWidget({
    super.key,
    required this.labelText,
    this.borderColor,
    this.height,
  });
  final String labelText;
  final Color? borderColor;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: TextStyle(color: kwhite,height: height),
      decoration: InputDecoration(
        label: Text(labelText),
        filled: true,
        fillColor: Color(0xFF262626),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor??kwhite),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor??kwhite),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(color: borderColor??kwhite),
        ),
      ),
    );
  }
}


import 'package:flutter/material.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/presentation/pages/sections/pending_and_complete_section.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class ListDisplaySection extends StatelessWidget {
  const ListDisplaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ConstrainedBox(
          constraints: BoxConstraints(maxHeight: 200),
          child: Container(width: double.infinity, color: bgTop),
        ),

        Expanded(
          child: Container(
            width: double.infinity,
            color: bgBottom,
            padding: EdgeInsets.only(top: 96, left: 28, right: 28),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                //Pendings and completed--------
                PendingAndCompletedSection(),
                Expanded(
                  child: ListView.builder(
                    physics: BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ConstrainedBox(
                          constraints: BoxConstraints(
                            minHeight: 72
                          ),
                          child: Container(
                            // height: 72,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFF262626),
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Center(
                              child: ListTile(
                                leading: Icon(
                                  Icons.check_circle,
                                  color: Color(0xFF1E6F9F),
                                ),
                                title: TextWidget(
                                  overflow: TextOverflow.ellipsis,
                                  maxLines: 1,
                                  text: "Do Math Homework",
                                  size: 21,
                                  color: kwhite,
                                ),
                                subtitle: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    TextWidget(text: "I have to complete math homework and draw a simple circle using pencil",color: Colors.white70,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                    TextWidget(text: "Due date: 09-March-2025",color: Colors.white60,maxLines: 2,overflow: TextOverflow.ellipsis,),
                                  ],
                                ),
                                trailing: Row(
                                  spacing: 5,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    InkWell(
                                      child: Image.asset(height: 20,"assets/edit.png"),
                                    ),
                                    InkWell(
                                      child: Image.asset(height: 20 ,"assets/delete.png"),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    itemCount: 10,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

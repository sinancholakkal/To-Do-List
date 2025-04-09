import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/bloc/pending_and_completed_bloc/pending_and_completed_bloc.dart';
import 'package:to_do_list/feature/presentation/widgets/text_widget.dart';

class PendingAndCompletedSection extends StatelessWidget {
  const PendingAndCompletedSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //SizedBox(height: 196),
        Row(
          spacing: 6,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Pending",
              color: Color(0xFF4EA8DE),
              size: 14,
              fontWeight: FontWeight.w700,
            ),
            Container(
              width: 22,
              height: 19,
              decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: BlocBuilder<
                  PendingAndCompletedBloc,
                  PendingAndCompletedState
                >(
                  builder: (context, state) {
                    int pending = 0;
                    if (state is CountLoadedState) {
                      pending = state.pendingCount;
                    }
                    return TextWidget(
                      text: pending.toString(),
                      color: kwhite,
                      size: 13,
                    );
                  },
                ),
              ),
            ),
          ],
        ),
        Spacer(),
        Row(
          spacing: 6,
          mainAxisSize: MainAxisSize.min,
          children: [
            TextWidget(
              text: "Completed",
              color: Color(0xFF1E6F9F),
              size: 14,
              fontWeight: FontWeight.w700,
            ),
            Container(
              width: 40,
              height: 19,
              decoration: BoxDecoration(
                color: Color(0xFF333333),
                borderRadius: BorderRadius.circular(999),
              ),
              child: Center(
                child: BlocBuilder<PendingAndCompletedBloc, PendingAndCompletedState>(
                  builder: (context, state) {
                    int taskLength =0;
                    int completed =0;
                    if(state is CountLoadedState){
                      taskLength = state.taskLength;
                      completed = state.completedCount;
                    }
                    return TextWidget(text: "$completed/$taskLength", color: kwhite, size: 13);
                  },
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_search/widget/search_item_display_section.dart';
import 'package:to_do_list/feature/presentation/pages/screen_search/widget/searching_section.dart';
class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

class _ScreenSearchState extends State<ScreenSearch> {
 

  @override
  void initState() {
    context.read<TaskBloc>().add(TaskAllGetEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: bgBottom,
      body: SafeArea(
        child: Column(
          children: [
            //Cupertino search field and Back button--------------
            SearchingSection(screenWidth: screenWidth),
          //There displaying initially all task and based on the search result----------------
           SearchItemDisplaySection() ,
          ],
        ),
      ),
    );
  }
}


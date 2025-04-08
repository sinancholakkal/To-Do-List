import 'package:flutter/material.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/sections/list_display_section.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home/sections/search_and_add_section.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //Task display section--
          ListDisplaySection(),
          //Search and add section-----
          SearchAndAddSection(),
        ],
      ),
    );
  }
}




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/core/theme/colors.dart';
import 'package:to_do_list/feature/bloc/search_bloc/search_bloc.dart';

class SearchingSection extends StatelessWidget {
  const  SearchingSection({
    super.key,
    required this.screenWidth,
  });

  final double screenWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //Back button--------------
        IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(Icons.arrow_back, color: kwhite),
        ),
    
        //Search fieald============
        SizedBox(
          width: screenWidth * 0.8,
          height: 50,
          child: CupertinoSearchTextField(
            onSubmitted: (value) {
              context.read<SearchBloc>().add(SearchQueryEvent(query: value.trim().toLowerCase()));
            },
            padding: EdgeInsets.symmetric(vertical: 12, horizontal: 10),
            style: TextStyle(fontSize: 16, color: kwhite),
          ),
        ),
      ],
    );
  }
}

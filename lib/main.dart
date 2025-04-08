import 'package:flutter/material.dart';
import 'package:to_do_list/feature/presentation/pages/screen_home.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF1E6F9F),
      ),
      home: ScreenHome(),
    );
  }
}
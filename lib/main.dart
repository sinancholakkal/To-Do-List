import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/feature/presentation/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_splash/screen_splash.dart';
import 'package:to_do_list/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => DatePickerBloc(),
        ),
        
      ],
      child:MaterialApp(
        theme: ThemeData(
          primaryColor: Color(0xFF1E6F9F),
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:to_do_list/feature/bloc/date_picker_bloc/date_picker_bloc.dart';
import 'package:to_do_list/feature/bloc/pending_and_completed_bloc/pending_and_completed_bloc.dart';
import 'package:to_do_list/feature/bloc/search_bloc/search_bloc.dart';
import 'package:to_do_list/feature/bloc/task_bloc/task_bloc.dart';
import 'package:to_do_list/feature/presentation/pages/screen_splash/screen_splash.dart';
import 'package:to_do_list/firebase_api/firebase_api.dart';
import 'package:to_do_list/firebase_options.dart';

// MUST BE a top-level function (not inside a class)
@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  await FirebaseMessaging.instance.subscribeToTopic('allUsers');
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
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
        BlocProvider(
          create: (context) => TaskBloc(),
        ),
        BlocProvider(
          create: (context) => PendingAndCompletedBloc(),
        ),
         BlocProvider(
          create: (context) => SearchBloc(),
        ),
      
      ],
      child:MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Color(0xFF1E6F9F),
        ),
        home: ScreenSplash(),
      ),
    );
  }
}
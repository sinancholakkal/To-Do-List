// import 'dart:developer';

// import 'package:firebase_messaging/firebase_messaging.dart';

// class FirebaseApi{
//   final _firebaseMessaging = FirebaseMessaging.instance;
//   Future<void>initNotification()async{
//     await _firebaseMessaging.requestPermission();
//     final tokens = await _firebaseMessaging.getToken();
//     log(tokens.toString());
//     FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
//   }
//   Future<void>handleBackgroundMessage(RemoteMessage message)async{
//     log("Title : ${message.notification?.title}");
//     log("Body : ${message.notification?.body}");
//     log("PlayLoad : ${message.data}");
//   }
// }

import 'dart:developer';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FirebaseApi {
  final _firebaseMessaging = FirebaseMessaging.instance;

  Future<void> initNotifications() async {
    // Request permission from the user
    await _firebaseMessaging.requestPermission();
    final fcmToken = await _firebaseMessaging.getToken();
    log('FCM Token: $fcmToken');

    // Listen for foreground messages
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
          log("Title : ${message.notification?.title}");
    log("Body : ${message.notification?.body}");
    log("PlayLoad : ${message.data}");
    LocalNotificationService.initialize();
    LocalNotificationService.display(message);
    
    });
  }
}

class LocalNotificationService {
  static final FlutterLocalNotificationsPlugin _notificationsPlugin =
      FlutterLocalNotificationsPlugin();

  static void initialize() {
    // Initialization settings for Android
    const InitializationSettings initializationSettings =
        InitializationSettings(
      android: AndroidInitializationSettings("@mipmap/ic_launcher"),
      iOS: DarwinInitializationSettings(),
    );

    _notificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (NotificationResponse notificationResponse) {
        // Handle notification tap
        print('notification payload: ${notificationResponse.payload}');
      },
    );
  }

  static Future<void> display(RemoteMessage message) async {
    try {
      // Create a Notification channel for Android
      const NotificationDetails notificationDetails = NotificationDetails(
        android: AndroidNotificationDetails(
          "my_channel_id", // Channel ID
          "My Channel",    // Channel Name
          importance: Importance.max,
          priority: Priority.high,
        ),
        iOS: DarwinNotificationDetails(),
      );

      // Show the notification
      await _notificationsPlugin.show(
        message.hashCode,
        message.notification?.title,
        message.notification?.body,
        notificationDetails,
        payload: message.data.toString(),
      );
    } catch (e) {
      print('Error displaying notification: $e');
    }
  }
}
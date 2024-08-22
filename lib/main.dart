import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications_learning/local_notification_service.dart';
import 'package:flutter_push_notifications_learning/push_notifications_service.dart';

import 'firebase_options.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform,);
  await Future.wait([
   PushNotificationsService.init(),
   LocalNotificationsService.init()
  ]);

  runApp(const MyApp());
}


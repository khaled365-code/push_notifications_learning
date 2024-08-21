import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_push_notifications_learning/firebase_options.dart';
import 'package:flutter_push_notifications_learning/push_notifications_service.dart';

import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  PushNotificationsService.init();
  runApp(const MyApp());
}





import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_push_notifications_learning/local_notification_service.dart';

class PushNotificationsService
{

  static FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;

 static Future<void> init() async
  {
   await firebaseMessaging.requestPermission();
   String? token=await firebaseMessaging.getToken();
   log(token??'null');
   FirebaseMessaging.onBackgroundMessage(handleBackgroundMessage);
   FirebaseMessaging.onMessage.listen((RemoteMessage message){

     LocalNotificationsService.showBasicNotification(message: message);
   });
  }

  static Future<void> handleBackgroundMessage(RemoteMessage message) async
  {
    await Firebase.initializeApp();
    log(message.notification!.title!);
  }










}



import 'dart:developer';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationsService
{

  static FirebaseMessaging firebaseMessaging=FirebaseMessaging.instance;

 static void init() async
  {
   await firebaseMessaging.requestPermission();
   String? token=await firebaseMessaging.getToken();
   log(token??'null');
   FirebaseMessaging.onBackgroundMessage(onBackgroundFun);
  }


  static Future<void> onBackgroundFun(RemoteMessage message) async
  {
    await Firebase.initializeApp();
    log(message.notification?.title??'null');

  }





}
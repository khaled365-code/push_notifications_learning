


import 'dart:async';
import 'dart:convert';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
class LocalNotificationsService
{

  static FlutterLocalNotificationsPlugin localNotificationsPlugin=FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> myStreamController=StreamController();
  static onNotificationTapped(NotificationResponse details){

    myStreamController.add(details);

  }

  static Future<void> init() async
  {
    InitializationSettings settings=InitializationSettings(
      android: AndroidInitializationSettings('@mipmap/ic_launcher'),
      iOS: DarwinInitializationSettings(),
    );
    await localNotificationsPlugin.initialize(settings,
        onDidReceiveNotificationResponse: onNotificationTapped,
        onDidReceiveBackgroundNotificationResponse: onNotificationTapped);

  }

  static void showBasicNotification({required RemoteMessage message}) async
  {
    final http.Response image = await http.get(Uri.parse(message.notification?.android?.imageUrl??''));
    var bigPictureStyleInformation = BigPictureStyleInformation(
      ByteArrayAndroidBitmap.fromBase64String(
        base64Encode(image.bodyBytes),
      ),
    );


    NotificationDetails notificationsDetails=NotificationDetails(
        android:  AndroidNotificationDetails(
          '1',
          'basic notification',
          importance: Importance.max,
          priority: Priority.high,
          styleInformation: bigPictureStyleInformation,
        ),
        iOS: DarwinNotificationDetails()
    );
    localNotificationsPlugin.show(
        1,
        message.notification?.title,
        message.notification?.body,
        notificationsDetails,
    );

  }






}
import 'dart:math';

import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_dev/controllers/auth_controller.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';

class NotificationHelper {
  static InitializationSettings get initializationSettings => null;
  
  static NotificationDetails? get platformChannelSpecifics => null;

  static Future<void> initialize(
      FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin) async {
    var androidInitialize =
        const AndroidInitializationSettings('notification_icon');
    var iOSInitialize = const IOSInitializationSettings();
    var initializationsSettings =
        InitializationSettings(android: androidInitialize, iOS: iOSInitialize);

    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: (String? payload) {
      try {
        if (payload != null && payload.isNotEmpty) {
        } else {}
      } catch (e) {
        if (kDebugMode) {
          print(e.toString());
        }
      }
      return;
    });
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      print(".........onMessage...........");
      print("onMessage: ${message.notification?.title}"
          "/${message.notification?.body}"
          "/${message.notification?.titleLocKey}");

      //HelperNotification.showNotification(message, flutterLocalNotificationsPlugin, false);

      if (Get.find<AuthController>().userLoggedIn()) {
        //Get.fin<OrderController>().getRunningOrders(1);
        //Get.fin<OrderController>().getHistoryOrders(1);
        //Get.fin<OrderController>().getNotificationList(1);

      }
    });
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      print("onOpenApp: ${message.notification?.title}"
          "/${message.notification?.body}"
          "/${message.notification?.titleLocKey}");
      try {
        if (message.notification?.titleLocKey != null) {
          //Get.toNamed(RouteHelper.getOrderDetailsRoute(int.parse(message.notification!.titleLocKey!)));
        } else {
          //Get.toNamed(RouteHelper.getNotificationRoute());
        }
      } catch (e) {
        print(e.toString());
      }
    });

    static Future<void> showNotification(RemoteMessage msg, FlutterLocalNotificationsPlugin fln)async{
      BigTextStyleInformation bigTextStyleInformation = BigTextStyleInformation(msg.notification!.body!, htmlFormatBigText: true,
      contentTitle: msg.notification!.title!, htmlFormatContentTitle:true,
      );
      AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails('channel_id_1', 'dbfood 2', importance: Importance.high,
      styleInformation: bigTextStyleInformation, priority: Priority.high,
      playSound: true,
      //sound: RowResourceAndroidNotificationSount('notification');

      NotificationDetails platformChannelSpecifics = NotificationDetails(
        android: androidPlatformChannelSpecifics(),
      iOS: const IOSNotificationDetails(),),
      await fln.show(0, msg.notification!.title!, msg.notification!.body!, platformChannelSpecifics,));

      }
    }
  }


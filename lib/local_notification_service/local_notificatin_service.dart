import 'dart:async';

import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

class LocalNotifacitionService {
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();
  static StreamController<NotificationResponse> streamController =
      StreamController();
  static onTap(NotificationResponse notificationResponse) {
    streamController.add(
      notificationResponse,
    );
  }

  static Future init() async {
    InitializationSettings settings = const InitializationSettings(
      android: AndroidInitializationSettings(
        "@mipmap/ic_launcher",
      ),
      iOS: DarwinInitializationSettings(),
    );
    flutterLocalNotificationsPlugin.initialize(
      settings,
      onDidReceiveBackgroundNotificationResponse: onTap,
      onDidReceiveNotificationResponse: onTap,
    );
  }

  Future showBasicNotification() async {
    NotificationDetails details = NotificationDetails(
      android: AndroidNotificationDetails(
        "id 1",
        "show basic notification",
        importance: Importance.max,
        priority: Priority.high,
        sound: RawResourceAndroidNotificationSound(
          "sound.wav".split(".").first,
        ),
      ),
    );
    flutterLocalNotificationsPlugin.show(
      0,
      "Basic Notification",
      "Show Basic Noitificatio",
      details,
    );
  }

  Future showRepeatedNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails("id 2", "show Repeated notification",
          importance: Importance.max, priority: Priority.high),
    );
    flutterLocalNotificationsPlugin.periodicallyShow(
      1,
      "ٌRepeated Notification",
      "Show ٌRepeated Noitificatio",
      RepeatInterval.everyMinute,
      details,
    );
  }

  Future shoScudeledNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails("id 3", "show Scudeled notification",
          importance: Importance.max, priority: Priority.high),
    );
    tz.initializeTimeZones();
    flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      "Scudeled Notification",
      "Show Scudeled Notification",
      tz.TZDateTime.now(tz.local).add(
        const Duration(
          seconds: 10,
        ),
      ),
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  Future showDailyScudeledNotification() async {
    NotificationDetails details = const NotificationDetails(
      android: AndroidNotificationDetails("id 3", "show Scudeled notification",
          importance: Importance.max, priority: Priority.high),
    );
    tz.initializeTimeZones();
    tz.setLocalLocation(
      tz.getLocation(
        "Africa/Cairo",
      ),
    );
    var currentTime = tz.TZDateTime.now(
      tz.local,
    );
    var scudeledTime = tz.TZDateTime(
      tz.local,
      currentTime.year,
      currentTime.month,
      currentTime.day,
      22,
    );
    if (scudeledTime.isBefore(
      currentTime,
    )) {
      scudeledTime = scudeledTime.add(
        const Duration(
          days: 1,
        ),
      );
    }
    flutterLocalNotificationsPlugin.zonedSchedule(
      2,
      "Scudeled Daily Notification",
      "Show Scudeled Daily Notification",
      scudeledTime,
      details,
      uiLocalNotificationDateInterpretation:
          UILocalNotificationDateInterpretation.absoluteTime,
    );
  }

  void cancelNotificatio(int id) async {
    await flutterLocalNotificationsPlugin.cancel(
      id,
    );
  }
}



//setup 
//simple notification
//repeated notification
//schudeled notification
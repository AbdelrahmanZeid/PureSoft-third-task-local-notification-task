import 'package:flutter/material.dart';
import 'package:local_notifacation_task/app.dart';
import 'package:local_notifacation_task/local_notification_service/local_notificatin_service.dart';
import 'package:local_notifacation_task/local_notification_service/work_manager_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    LocalNotifacitionService.init(),
    WorkManagerService().init(),
  ]);
  runApp(
    const MyApp(),
  );
}

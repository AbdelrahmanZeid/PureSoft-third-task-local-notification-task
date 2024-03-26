
import 'package:flutter/material.dart';
import 'package:local_notifacation_task/local_notification_service/local_notificatin_service.dart';
import 'package:local_notifacation_task/second_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void listenToStream() {
    LocalNotifacitionService.streamController.stream.listen((event) {
      print(
        event.payload,
      );
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) {
            return SecondPage();
          },
        ),
      );
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    listenToStream();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              LocalNotifacitionService().showBasicNotification();
            },
            leading: const Icon(
              Icons.notification_add,
            ),
            title: const Text(
              "Basic Notification",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                LocalNotifacitionService().cancelNotificatio(
                  0,
                );
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              LocalNotifacitionService().showRepeatedNotification();
            },
            leading: const Icon(
              Icons.notification_add,
            ),
            title: const Text(
              "Repeated Notification",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                LocalNotifacitionService().cancelNotificatio(
                  1,
                );
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              LocalNotifacitionService().shoScudeledNotification();
            },
            leading: const Icon(
              Icons.notification_add,
            ),
            title: const Text(
              "Scudeled Notification",
              style: TextStyle(
                fontSize: 30,
                color: Colors.black,
              ),
            ),
            trailing: IconButton(
              onPressed: () {
                LocalNotifacitionService().cancelNotificatio(
                  1,
                );
              },
              icon: const Icon(
                Icons.cancel,
                color: Colors.red,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

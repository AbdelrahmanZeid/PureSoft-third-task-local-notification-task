import 'package:local_notifacation_task/local_notification_service/local_notificatin_service.dart';
import 'package:workmanager/workmanager.dart';

class WorkManagerService {
  void registerOneTask() async {
    await Workmanager().registerPeriodicTask(
      "id 1",
      "show simple notifacation",
      frequency: const Duration(
        minutes: 15,
      ),
    );
  }

  void canceltask(String id) {
    Workmanager().cancelByUniqueName(
      id,
    );
  }

  Future<void> init() async {
    await Workmanager().initialize(
      actionTask,
      isInDebugMode: true,
    );
    registerOneTask();
  }
}

@pragma('vm:entry-point')
actionTask() {
  Workmanager().executeTask((taskName, inputData) {
    LocalNotifacitionService().showDailyScudeledNotification();
    return Future.value(
      true,
    );
  });
}

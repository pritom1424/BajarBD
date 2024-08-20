/* // background_service.dart
import 'package:workmanager/workmanager.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

void backgroundTask() {
  Workmanager().executeTask((task, inputData) async {
    // API call
    final response =
        await http.get(Uri.parse('https://your-laravel-api.com/notifications'));

    if (response.statusCode == 200) {
      final notifications = jsonDecode(response.body);
      if (notifications.isNotEmpty) {
        // Show local notification
        var androidDetails = AndroidNotificationDetails(
            'channelId', 'channelName',
            priority: Priority.high, importance: Importance.max);
        var notificationDetails = NotificationDetails(android: androidDetails);
        await flutterLocalNotificationsPlugin.show(
          0,
          notifications[0]['title'],
          notifications[0]['body'],
          notificationDetails,
        );
      }
    }

    return Future.value(true);
  });
}

void initializeWorkManager() {
  Workmanager().initialize(backgroundTask, isInDebugMode: true);
}

void registerWorkManagerTask() {
  Workmanager().registerPeriodicTask(
    "1",
    "simplePeriodicTask",
    frequency: Duration(minutes: 15),
  );
}
 */
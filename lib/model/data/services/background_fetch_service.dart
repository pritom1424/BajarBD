/* // background_fetch_service.dart
import 'package:background_fetch/background_fetch.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void backgroundFetchHeadlessTask(HeadlessTask task) async {
  String taskId = task.taskId;
  bool timeout = task.timeout;
  if (timeout) {
    BackgroundFetch.finish(taskId);
    return;
  }

  // API call
  final response = await http.get(Uri.parse('https://your-laravel-api.com/notifications'));

  if (response.statusCode == 200) {
    final notifications = jsonDecode(response.body);
    if (notifications.isNotEmpty) {
      // Show local notification
      var androidDetails = AndroidNotificationDetails('channelId', 'channelName',
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

  BackgroundFetch.finish(taskId);
}

void initializeBackgroundFetch() {
  BackgroundFetch.configure(
    BackgroundFetchConfig(
      minimumFetchInterval: 15,  // Fetch every 15 minutes
      stopOnTerminate: false,
      startOnBoot: true,
      enableHeadless: true,
    ),
    onBackgroundFetch,
    onBackgroundFetchTimeout,
  );
}

void onBackgroundFetch(String taskId) async {
  // This is the regular callback (not headless)
  final response = await http.get(Uri.parse('https://your-laravel-api.com/notifications'));

  if (response.statusCode == 200) {
    final notifications = jsonDecode(response.body);
    if (notifications.isNotEmpty) {
      // Show local notification
      var androidDetails = AndroidNotificationDetails('channelId', 'channelName',
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

  BackgroundFetch.finish(taskId);
}

void onBackgroundFetchTimeout(String taskId) async {
  // This function is called if the background fetch exceeds its timeout
  BackgroundFetch.finish(taskId);
}
 */
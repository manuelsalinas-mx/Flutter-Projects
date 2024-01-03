import 'package:flutter_local_notifications/flutter_local_notifications.dart';

/// Entendamos por "Local Notification" hacer que la notificacion se pueda mostrar como un globo encima de todo
class LocalNotifications {
  static Future<void> requestPermissionLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.requestNotificationsPermission();
  }

  static Future<void> initializeLocalNotifications() async {
    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

    const initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');
    //TODO: ios part

    const initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      // iOS:
    );

    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static void showLocalNotification({
    required int id,
    String? title,
    String? body,
    String? data,
  }) {
    const androidDetails = AndroidNotificationDetails(
        'channelId', 'channelName',
        playSound: true,
        importance: Importance.max,
        priority: Priority.high);

    const notificationDetails = NotificationDetails(
      android: androidDetails,
      // iOS:
    );

    final flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
    flutterLocalNotificationsPlugin.show(id, title, body, notificationDetails, payload: data);
  }
}

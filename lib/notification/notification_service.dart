import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static final NotificationService _notificationService =
      NotificationService._internal();

  //instance of FlutterLocalNotificationsPlugin
  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  factory NotificationService() {
    return _notificationService;
  }

  NotificationService._internal();

  Future<void> init(onSelectNotification) async {
    var initializationSettingsAndroid = new AndroidInitializationSettings('app_icon');

    var initializationSettings =
        new InitializationSettings(android: initializationSettingsAndroid);
    flutterLocalNotificationsPlugin.initialize(initializationSettings,
        onSelectNotification: onSelectNotification);

    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        'PIS', 'PICK IN STORE', 'Notification Channel for PIS',
        importance: Importance.high, priority: Priority.high);

    var platformChannelSpecifics =
        new NotificationDetails(android: androidPlatformChannelSpecifics);

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Bestellungen',
      'Bitte überprüfen Sie neue Bestellungen!',
      Time(10, 0, 0),
      platformChannelSpecifics,
    );

    await flutterLocalNotificationsPlugin.showDailyAtTime(
      0,
      'Bestellungen',
      'Bitte überprüfen Sie neue Bestellungen!',
      Time(14, 0, 0),
      platformChannelSpecifics,
    );
  }
}


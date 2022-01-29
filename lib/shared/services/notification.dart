import 'package:crv/shared/constants/config.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationService {
  static var initializationSettingsAndroid =
      new AndroidInitializationSettings('@mipmap/ic_launcher');

  static late FlutterLocalNotificationsPlugin flutterNotification;

  static init(dynamic onSelect) {
    var initializationSettingsIOS = new IOSInitializationSettings();

    var initializationSettings = new InitializationSettings(
        android: NotificationService.initializationSettingsAndroid,
        iOS: initializationSettingsIOS);
    NotificationService.flutterNotification =
        new FlutterLocalNotificationsPlugin()
          ..initialize(initializationSettings, onSelectNotification: onSelect);
  }

  static Future showNotification(title, body) async {
    var androidPlatformChannelSpecifics = new AndroidNotificationDetails(
        title, Config.packageId,
        subText: body, importance: Importance.max, priority: Priority.high);
    var iOSPlatformChannelSpecifics = new IOSNotificationDetails();
    var platformChannelSpecifics = new NotificationDetails(
        android: androidPlatformChannelSpecifics,
        iOS: iOSPlatformChannelSpecifics);
    await flutterNotification.show(
      0,
      title,
      body,
      platformChannelSpecifics,
      payload: "",
    );
  }
}

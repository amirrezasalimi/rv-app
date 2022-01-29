import 'package:crv/shared/helpers/url.dart';
import 'package:crv/shared/services/notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseFcm {
  static late Map<String, dynamic> lastMessageData;

  static Future<dynamic> onSelectNotification(String text) {
    handleCustomActions(FirebaseFcm.lastMessageData);
    return Future.value();
  }

  static init() async {
    try {
      // config and initialize native notification handler
      await NotificationService.init((dynamic msg) {
        FirebaseFcm.onSelectNotification(msg);
      });

      Future.delayed(Duration(milliseconds: 0), () {
        FirebaseMessaging.onMessage.listen((event) {
          FirebaseFcm.lastMessageData = event.data;
          NotificationService.showNotification(
              event.notification?.title ?? "", event.notification?.body ?? "");
        });

        FirebaseMessaging.onMessageOpenedApp.listen((event) {
          handleCustomActions(event.data);
        });
        FirebaseMessaging.onBackgroundMessage(FirebaseFcm.onBackgroundMessage);
      });

      FirebaseMessaging.instance.getToken().then((token) {
        print(token);
      });
      // handle message coming from clicked notification when app closed
      FirebaseMessaging.instance.getInitialMessage().then((message) {
        if (message != null) {
          handleCustomActions(message.data);
        }
      });
    } catch (_) {
      print(_);
    }
  }

  static Future<void> onBackgroundMessage(RemoteMessage message) {
    FirebaseFcm.lastMessageData = message.data;
    return Future.value();
  }

  static handleCustomActions(Map<String, dynamic> data) {
    if (data.containsKey("link")) {
      openLink(data["link"]);
    }

    if (data.containsKey("any")) {}

/*    if (FirebaseFcm.lastMessageData != null) {
      FirebaseFcm.lastMessageData = null;
    }*/
  }
}

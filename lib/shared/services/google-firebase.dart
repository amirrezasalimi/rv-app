import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase-fcm.dart';

class GoogleFirebase{
  static Future<dynamic> initFirebase() async {
    try {
      if (Firebase.apps.length == 0) {
        // firebase config
        await Firebase.initializeApp(
            name: "relab-crv",
            options: new FirebaseOptions(
                projectId: "relab-crv",
                messagingSenderId: "583613066440",
                appId: "1:583613066440:android:6ad65fc28139725d9009fd",
                apiKey: "AIzaSyAJ2LQQqE8zdgr2U2y1-fASGV4YEhBuBW8"));
      } else {
        Firebase.app("relab-crv");
      }
    } catch (error) {}

    return Future.value();
  }

  static Future initFcm() async {
    FirebaseMessaging messaging = FirebaseMessaging.instance;
    await FirebaseFcm.init();
    return Future.value(messaging);
  }
}
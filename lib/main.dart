import 'package:crv/core/theme/app_theme.dart';
import 'package:crv/modules/splash/binding.dart';
import 'package:crv/routes.dart';
import 'package:crv/shared/constants/routes.dart';
import 'package:crv/shared/services/google-firebase.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GoogleFirebase.initFirebase();
  await GoogleFirebase.initFcm();

  runApp(App());
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);

  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  FirebaseAnalytics _analytics = FirebaseAnalytics();

  FirebaseAnalyticsObserver appAnalyticsObserver() =>
      FirebaseAnalyticsObserver(analytics: _analytics);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      navigatorObservers: [appAnalyticsObserver()],
      debugShowCheckedModeBanner: false,
      initialBinding: SplashBinding(),
      initialRoute: Routes.INITIAL,
      theme: appThemeData,
      defaultTransition: Transition.fade,
      getPages: AppPages.pages,
      textDirection: TextDirection.ltr,
      locale: Locale('en', 'US'),
      // translationsKeys: AppTranslation.translations,
    );
  }
}

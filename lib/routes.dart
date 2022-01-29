import 'package:crv/modules/main/binding.dart';
import 'package:crv/modules/main/page.dart';
import 'package:crv/modules/session/binding.dart';
import 'package:crv/modules/session/page.dart';
import 'package:crv/modules/splash/binding.dart';
import 'package:crv/modules/splash/page.dart';
import 'package:crv/shared/constants/routes.dart';
import 'package:get/get.dart';



class AppPages {
  static final pages = [
    GetPage(
      name: Routes.INITIAL,
      binding: SplashBinding(),
      page: () => Splash(),
    ),
    GetPage(
      name: Routes.MAIN,
      binding: MainBinding(),
      page: () => Main(),
    ),
    GetPage(
      name: Routes.SESSION,
      binding: SessionBinding(),
      page: () => Session(),
    )
  ];
}

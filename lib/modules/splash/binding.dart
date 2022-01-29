import 'package:crv/modules/splash/controller.dart';
import 'package:crv/shared/controllers/localSession.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';

class SplashBinding extends Bindings{
  @override
  void dependencies() async {
    await Hive.initFlutter();
    Get.put(SplashController());
    Get.put(localSessionController(),permanent: true);
  }
}
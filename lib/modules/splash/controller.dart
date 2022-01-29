import 'package:crv/shared/constants/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Color(0xff8388EF)));
    Future.delayed(Duration(milliseconds: 1500), () {
      Get.offAndToNamed(Routes.MAIN);
    });
  }
}

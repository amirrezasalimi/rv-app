import 'package:crv/modules/session/controller.dart';
import 'package:get/get.dart';

class SessionBinding extends Bindings{
  @override
  void dependencies() {
      Get.put(SessionPageController());
  }
}
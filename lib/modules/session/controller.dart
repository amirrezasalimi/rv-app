import 'package:crv/shared/controllers/localSession.dart';
import 'package:crv/shared/models/session.dart';
import 'package:get/get.dart';

class SessionPageController extends GetxController {
  localSessionController _sessions = Get.find<localSessionController>();

  dynamic get sessionKey => Get.arguments[0] as dynamic;
  Rx<SessionItem> currentSession = SessionItem().obs;

  var showTargetsPictures = false.obs;

  showTargets() {
    showTargetsPictures.toggle();
  }

  setStatus(int newStatus) {
    currentSession.value.status = newStatus;
    _sessions.updateByKey(sessionKey, currentSession.value);
    currentSession.value = _sessions.findByKey(sessionKey);
  }

  removeSession() {
    _sessions.removeByKey(currentSession.value.key ?? "");
    Get.close(2);
  }

  @override
  void onInit() async {
    super.onInit();
    currentSession.value = _sessions.findByKey(sessionKey);
  }
}

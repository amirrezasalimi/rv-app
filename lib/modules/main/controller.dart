import 'package:crv/shared/controllers/localSession.dart';
import 'package:crv/shared/models/session.dart';
import 'package:get/get.dart';

class MainController extends GetxController {
  var sessionsController = Get.find<localSessionController>();
  var isAddSessionLoading = false.obs;

  add(SessionItem session) {
    isAddSessionLoading.value = true;
    sessionsController
        .add(session)
        .then((value) => isAddSessionLoading.value = false);
       // .catchError((_)=>isAddSessionLoading.value = false);
  }
}

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ApiClient {
  static final ApiClient _singleton = ApiClient._internal();
  late Dio dio;

  factory ApiClient() {
    return _singleton;
  }

  ApiClient._internal() {
    BaseOptions options = BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
    );
    dio = Dio(options);
    addInterceptors();
  }

  addInterceptors() {
    dio.interceptors.add(InterceptorsWrapper(
      onRequest: (options, handler) {
        // options.headers["authToken"] = GlobalData.emoCloudToken;
        handler.next(options);
      },
      onResponse: (res, handler) async {
        bool showErrorMessage = (res.requestOptions.data["notif"] == null
            ? true
            : res.requestOptions.data["notif"]);
        if (showErrorMessage &&
            res.data != null &&
            res.data["success"] == 0 &&
            res.data["message"] != null) {
          Get.showSnackbar(GetBar(
            duration: Duration(milliseconds: 2000),
            message: res.data["message"],
          ));
        }
        handler.next(res);
      },
      onError: (error, handler) {
        if (error.type == DioErrorType.other) {
          Get.showSnackbar(GetBar(
            duration: Duration(milliseconds: 2000),
            message: "connection problem.",
          ));
        }
        handler.next(error);
      },
    ));
  }
}

final Dio apiClient = ApiClient().dio;

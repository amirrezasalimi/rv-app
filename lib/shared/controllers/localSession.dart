import 'dart:convert';
import 'dart:math';

import 'package:crv/shared/hive-models/session.dart';
import 'package:crv/shared/models/session-target.dart';
import 'package:crv/shared/models/session.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;

class localSessionController extends GetxController {
  late Box<Session> sessionBox;

  @override
  void onInit() async {
    super.onInit();
    Hive.registerAdapter(SessionAdapter());
    sessionBox = await Hive.openBox('sessionHistory2');
    loadSessions();
  }

  RxList<SessionItem> sessionsHistory = RxList<SessionItem>([]);

  Future<String> getRandomImage() async {
    Uri redirectUri = Uri();
    int id = 1;
    try {
      http.Request req =
          http.Request("Get", Uri.parse("https://picsum.photos/500"))
            ..followRedirects = false;
      http.Client baseClient = http.Client();
      http.StreamedResponse response = await baseClient.send(req);
      redirectUri = Uri.parse(response.headers['location'] ?? "");
      id = int.parse(response.headers["picsum-id"] ?? "1");
    } catch (_e) {
      print("error ${e}");
    }
    return Future.value("https://picsum.photos/id/${id}/500/500");
  }

  loadSessions() async {
    sessionsHistory.value = await getSessions();
    refresh();
  }

  findByKey(dynamic key) {
    return SessionItem.fromSessionModel(sessionBox.get(key) as Session);
  }

  updateByKey(dynamic key, SessionItem session) {
    var sessionMap = Session();
    sessionMap.id = session.id;
    sessionMap.title = session.title;
    sessionMap.status = session.status;
    sessionMap.targets = json.encode(session.targets);
    sessionBox.put(key, sessionMap);
    loadSessions();
  }

  removeByKey(dynamic key) {
    sessionBox.delete(key);
    loadSessions();
  }

  Future add(SessionItem session) async {
    var sessionMap = Session();
    Random random = new Random();
    int randId = random.nextInt(1000);

    int i = 0;
    List<SessionTarget> targets = List.from(session.targets);
    for (SessionTarget _ in targets) {
      targets[i].id = "${i + 1}";
      targets[i].picture = await getRandomImage();
      i++;
    }

    var targetsJson = jsonEncode(targets);

    sessionMap.id = "$randId";
    sessionMap.title = session.title;
    sessionMap.status = SessionStatus.inProgress;
    sessionMap.targets = targetsJson;
    sessionBox.add(sessionMap);
    await loadSessions();
  }

  Future<List<SessionItem>> getSessions() {
    List<SessionItem> sessions = sessionBox.values
        .map((item) {
          return SessionItem.fromSessionModel(item);
        })
        .toList()
        .cast();
    return Future.value(new List<SessionItem>.from(sessions.reversed));
  }
}

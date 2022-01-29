import 'dart:convert';

import 'package:crv/shared/hive-models/session.dart';
import 'package:crv/shared/models/session-target.dart';

abstract class SessionStatus {
  static const Correct = 1;
  static const Wrong = 2;
  static const inProgress = 3;
}


class SessionItem {
  SessionItem();

  late dynamic key;
  late int status; // correct | wrong | in-progress
  late String id;

  late String title;
  late List<SessionTarget> targets;

  static fromSessionModel(Session session) {
    var sessionItemModel = SessionItem();
    sessionItemModel.key = session.key;
    sessionItemModel.id = session.id;
    sessionItemModel.title = session.title!=""? session.title:"Untitled";
    sessionItemModel.status = session.status;
    // targets decode
    Iterable targets = json.decode(session.targets);
    sessionItemModel.targets = List<SessionTarget>.from(
        targets.map((obj) => SessionTarget.fromJson(obj)));
    return sessionItemModel;
  }
}

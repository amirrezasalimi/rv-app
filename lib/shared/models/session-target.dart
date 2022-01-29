import 'package:json_annotation/json_annotation.dart';

part "session-target.g.dart";

@JsonSerializable()
class SessionTarget {
  String? id="";
  String? title="";
  String? picture="";

  SessionTarget();

  factory SessionTarget.fromJson(Map<String, dynamic> json) =>
      _$SessionTargetFromJson(json);

  Map<String, dynamic> toJson() => _$SessionTargetToJson(this);
}

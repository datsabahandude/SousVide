import 'dart:convert';

AlarmModel modelFromJson(String str) => AlarmModel.fromJson(json.decode(str));

String modelToJson(AlarmModel data) => json.encode(data.toJson());

class AlarmModel {
  String? label;
  String? dateTime;
  bool? check;
  int? part;
  int? id;

  AlarmModel({
    required this.label,
    required this.dateTime,
    required this.check,
    required this.part,
    required this.id,
  });

  factory AlarmModel.fromJson(Map<String, dynamic> json) => AlarmModel(
        label: json["label"],
        dateTime: json["dateTime"],
        check: json["check"],
        part: json["part"],
        id: json["id"],
      );

  Map<String, dynamic> toJson() => {
        "label": label,
        "dateTime": dateTime,
        "check": check,
        "part": part,
        "id": id,
      };
}

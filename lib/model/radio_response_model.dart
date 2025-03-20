// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

RadioResponseModel welcomeFromJson(String str) =>
    RadioResponseModel.fromJson(json.decode(str));

String welcomeToJson(RadioResponseModel data) => json.encode(data.toJson());

class RadioResponseModel {
  List<Radio> radios;

  RadioResponseModel({
    required this.radios,
  });

  factory RadioResponseModel.fromJson(Map<String, dynamic> json) =>
      RadioResponseModel(
        radios: List<Radio>.from(json["radios"].map((x) => Radio.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "radios": List<dynamic>.from(radios.map((x) => x.toJson())),
      };
}

class Radio {
  int id;
  String name;
  String url;
  DateTime? recentDate;

  Radio({
    required this.id,
    required this.name,
    required this.url,
    required this.recentDate,
  });

  factory Radio.fromJson(Map<String, dynamic> json) => Radio(
        id: json["id"],
        name: json["name"],
        url: json["url"],
        recentDate: json["recent_date"] == null
            ? null
            : DateTime.parse(json["recent_date"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "url": url,
        "recent_date": recentDate?.toIso8601String(),
      };
}

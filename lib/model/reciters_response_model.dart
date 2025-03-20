// To parse this JSON data, do
//
//     final recitersResponseModel = recitersResponseModelFromJson(jsonString);

import 'dart:convert';

RecitersResponseModel recitersResponseModelFromJson(String str) =>
    RecitersResponseModel.fromJson(json.decode(str));

String recitersResponseModelToJson(RecitersResponseModel data) =>
    json.encode(data.toJson());

class RecitersResponseModel {
  List<Reciter> reciters;

  RecitersResponseModel({
    required this.reciters,
  });

  factory RecitersResponseModel.fromJson(Map<String, dynamic> json) =>
      RecitersResponseModel(
        reciters: List<Reciter>.from(
            json["reciters"].map((x) => Reciter.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "reciters": List<dynamic>.from(reciters.map((x) => x.toJson())),
      };
}

class Reciter {
  int id;
  String name;
  String letter;
  DateTime date;
  List<Moshaf> moshaf;

  Reciter({
    required this.id,
    required this.name,
    required this.letter,
    required this.date,
    required this.moshaf,
  });

  factory Reciter.fromJson(Map<String, dynamic> json) => Reciter(
        id: json["id"],
        name: json["name"],
        letter: json["letter"],
        date: DateTime.parse(json["date"]),
        moshaf:
            List<Moshaf>.from(json["moshaf"].map((x) => Moshaf.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "letter": letter,
        "date": date.toIso8601String(),
        "moshaf": List<dynamic>.from(moshaf.map((x) => x.toJson())),
      };
}

class Moshaf {
  int id;
  String name;
  String server;
  int surahTotal;
  int moshafType;
  String surahList;

  Moshaf({
    required this.id,
    required this.name,
    required this.server,
    required this.surahTotal,
    required this.moshafType,
    required this.surahList,
  });

  factory Moshaf.fromJson(Map<String, dynamic> json) => Moshaf(
        id: json["id"],
        name: json["name"],
        server: json["server"],
        surahTotal: json["surah_total"],
        moshafType: json["moshaf_type"],
        surahList: json["surah_list"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "server": server,
        "surah_total": surahTotal,
        "moshaf_type": moshafType,
        "surah_list": surahList,
      };
}

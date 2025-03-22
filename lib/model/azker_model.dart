import 'dart:convert';

import 'package:flutter/services.dart';

AzkerModel azkerrModelFromJson(String str) =>
    AzkerModel.fromJson(json.decode(str));

String azkerModelToJson(AzkerModel data) => json.encode(data.toJson());

class AzkerModel {
  String category;
  String count;
  String description;
  String reference;
  String content;

  AzkerModel({
    required this.category,
    required this.count,
    required this.description,
    required this.reference,
    required this.content,
  });

  factory AzkerModel.fromJson(Map<String, dynamic> json) => AzkerModel(
        category: json["category"],
        count: json["count"],
        description: json["description"],
        reference: json["reference"],
        content: json["content"],
      );

  Map<String, dynamic> toJson() => {
        "category": category,
        "count": count,
        "description": description,
        "reference": reference,
        "content": content,
      };
  static Future<List<AzkerModel>> loadAzkarModel(String azkarType) async {
    try {
      String jsonString = await rootBundle.loadString("assets/text/azkar.json");
      print("JSON Loaded Successfully: $jsonString"); // تأكد من تحميل البيانات

      var jsonContent = jsonDecode(jsonString);

      if (jsonContent[azkarType] is List) {
        List<AzkerModel> azkar = (jsonContent[azkarType] as List)
            .map((e) => AzkerModel.fromJson(e))
            .toList();
        return azkar;
      } else {
        throw Exception("Azkar not found or not in a list");
      }
    } catch (e) {
      print("Error loading Azkar: $e");
      throw Exception("Error loading Azkar: $e");
    }
  }
}

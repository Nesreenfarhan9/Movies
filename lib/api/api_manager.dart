import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:islaami/model/radio_response_model.dart';
import 'package:islaami/model/reciters_response_model.dart';
import 'package:islaami/model/time_response_model.dart';

class ApiManager {
  static Future<RadioResponseModel> getRadioData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/radios?language=ar");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RadioResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }

  static Future<RecitersResponseModel> getreciterData() async {
    try {
      Uri uri = Uri.parse("https://mp3quran.net/api/v3/reciters");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return RecitersResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }

  static Future<TimeResponseModel> gettimeData() async {
    try {
      var date = DateFormat('dd-MM-yyyy').format(DateTime.now());
      Uri uri = Uri.parse(
          "https://api.aladhan.com/v1/timingsByCity/$date?city=cairo&country=egypt");
      var response = await http.get(uri);
      var jsonResponse = jsonDecode(response.body);
      return TimeResponseModel.fromJson(jsonResponse);
    } catch (e) {
      throw e;
    }
  }
}

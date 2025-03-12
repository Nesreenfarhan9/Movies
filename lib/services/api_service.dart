import 'dart:convert';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:movies/services/UpdateProfileRequest.dart';
import 'package:movies/services/UpdateProfileResponse.dart';

class ApiService {
  final Dio _dio = Dio();

  final String baseUrl = 'https://route-movie-apis.vercel.app/';
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjkwYzRiZjFkZGFjMWRhYzEzMDYwNCIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3NDE3Mzg1MjZ9.5_lyzog_g6AukKAU4UFk8-Q3rM2Fn9ZffTKcCTUuMTY";

  Future<UpdateProfileResponse> updateProfile(UpdateProfileRequest request, String token) async {
    try {
      print("Request Data: ${request.toJson()}");

      final response = await _dio.patch(
        "$baseUrl/profile",
        data:  jsonEncode(request.toJson()),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      print("Response Data: ${response.data}");

      if (response.statusCode == 200) {
        return UpdateProfileResponse.fromJson(response.data);
      } else {
        throw Exception("Failed to update profile: ${response.data['message']}");
      }
    } catch (e) {
      print("Error in updateProfile API Call: $e");
      throw Exception("Error updating profile: $e");    }
  }
}

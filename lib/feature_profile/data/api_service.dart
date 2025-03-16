import 'package:dio/dio.dart';

import 'UpdateProfileRequest.dart';
import 'UpdateProfileResponse.dart';

class ApiService {
  final Dio _dio = Dio(BaseOptions(
      followRedirects: true,
      validateStatus: (status) {
        return status! <= 500;
      }));
  final String baseUrl = 'https://route-movie-apis.vercel.app';

  Future<UpdateProfileResponse> updateProfile(
      UpdateProfileRequest request, String token) async {
    try {
      final response = await _dio.patch(
        "$baseUrl/profile",
        data: request.toJson(),
        options: Options(
          headers: {
            "Authorization": "Bearer $token",
            "Content-Type": "application/json",
            "Accept": "application/json",
          },
        ),
      );

      if (response.statusCode == 200 || response.statusCode == 204) {
        return UpdateProfileResponse.fromJson(response.data);
      } else {
        throw Exception(
            "Failed to update profile: ${response.data['message']}");
      }
    } catch (e) {
      throw Exception("Error updating profile: $e");
    }
  }
}

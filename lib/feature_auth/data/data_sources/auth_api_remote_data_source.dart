import 'package:dio/dio.dart';
import 'package:movies/feature_auth/data/data_sources/auth_remote_data_source.dart';
import 'package:movies/feature_auth/data/models/login_request.dart';
import 'package:movies/feature_auth/data/models/login_response.dart';
import 'package:movies/feature_auth/data/models/register_request.dart';
import 'package:movies/feature_auth/data/models/register_response.dart';
import 'package:movies/shared/constants.dart';

class AuthAPIRemoteDataSource implements AuthRemoteDataSource {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: APIConstants.baseURL,
    ),
  );

  Future<LoginResponse> login(LoginRequest request) async {
    try {
      print(
          "Calling API: ${_dio.options.baseUrl}${APIConstants.loginEndpoint}");
      print("Request Data: ${request.toJson()}");

      final response = await _dio.post(
        APIConstants.loginEndpoint,
        data: request.toJson(),
      );
      print(" Raw Response Type: ${response.data.runtimeType}");
      print(" Raw Response Data: ${response.data}");

      print("Response Status Code: ${response.statusCode}");
      print("Response Data: ${response.data}");

      return LoginResponse.fromJson(response.data);
    } on DioException catch (e) {
      print("Login API Error: ${e.response?.statusCode} - ${e.response?.data}");
      throw Exception("Login failed: ${e.response?.data}");
    }
  }

  Future<RegisterResponse> register(RegisterRequest request) async {
    try {
      print(
          " Calling API: ${_dio.options.baseUrl}${APIConstants.registerEndpoint}");
      print(" Request Data: ${request.toJson()}");

      final response = await _dio.post(
        APIConstants.registerEndpoint,
        data: request.toJson(),
      );

      print(" Response Status Code: ${response.statusCode}");
      print("📄 Response Data: ${response.data}");

      return RegisterResponse.fromJson(response.data);
    } on DioException catch (e) {
      print(
          " Register API Error: ${e.response?.statusCode} - ${e.response?.data}");
      throw Exception("Register failed: ${e.response?.data}");
    }
  }
}

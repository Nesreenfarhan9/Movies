import 'package:movies/feature_auth/data/models/login_request.dart';
import 'package:movies/feature_auth/data/models/register_request.dart';
import 'package:movies/feature_auth/data/models/register_response.dart';
import 'package:movies/feature_auth/data/models/login_response.dart';

abstract class AuthRemoteDataSource {
  Future<RegisterResponse> register(RegisterRequest request);

  Future<LoginResponse> login(LoginRequest request);
}

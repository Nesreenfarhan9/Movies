import 'package:movies/feature_auth/data/data_sources/auth_remote_data_source.dart';
import 'package:movies/feature_auth/data/models/data_model.dart';
import 'package:movies/feature_auth/data/models/login_request.dart';
import 'package:movies/feature_auth/data/models/register_request.dart';


class AuthRepositories {
   final AuthRemoteDataSource _remoteDataSource;

  AuthRepositories(this._remoteDataSource);

  Future <DataModel>register(RegisterRequest request)async{
    final response = await _remoteDataSource.register(request);
    return response.data;
  }
  Future <String>login(LoginRequest request)async{
    final response = await _remoteDataSource.login(request);
    return response.data;
  }
}
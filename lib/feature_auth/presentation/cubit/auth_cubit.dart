import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/data/data_sources/auth_api_remote_data_source.dart';
import 'package:movies/feature_auth/data/models/login_request.dart';
import 'package:movies/feature_auth/data/models/register_request.dart';
import 'package:movies/feature_auth/data/repositories/auth_repositories.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AuthInitial());
  final AuthRepositories _authRepositories = AuthRepositories(
    AuthAPIRemoteDataSource(),
  );

  Future<void> register(RegisterRequest request) async {
    try{
      emit(RegisterLoading());
      await _authRepositories.register(request);
    emit(RegisterSuccess());
    }catch(error){
      emit(RegisterError(error.toString()));
    }
  }
  Future<void> login(LoginRequest request) async {
    try{
      emit(LoginLoading());
      await _authRepositories.login(request);
      emit(LoginSuccess());
    }catch(error){
      emit(LoginError(error.toString()));
    }
  }
}

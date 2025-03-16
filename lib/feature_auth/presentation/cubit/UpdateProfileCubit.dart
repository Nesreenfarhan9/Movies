import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/UpdateProfileRequest.dart';
import 'package:movies/services/UpdateProfileResponse.dart';

abstract class UpdateProfileState {}

class UpdateProfileInitial extends UpdateProfileState {}

class UpdateProfileLoading extends UpdateProfileState {}

class UpdateProfileSuccess extends UpdateProfileState {
  final UpdateProfileResponse response;
  UpdateProfileSuccess(this.response);
}

class UpdateProfileFailure extends UpdateProfileState {
  final String error;
  UpdateProfileFailure(this.error);
}

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final ApiService apiService;

  UpdateProfileCubit(this.apiService) : super(UpdateProfileInitial());

  Future<void> updateProfile(UpdateProfileRequest request, String token) async {
    emit(UpdateProfileLoading());

    try {
      final response = await apiService.updateProfile(request, token);
      emit(UpdateProfileSuccess(response));
    } catch (e) {
      emit(UpdateProfileFailure(e.toString()));
    }
  }
}

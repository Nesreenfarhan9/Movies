import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/UpdateProfileRequest.dart';
import '../../data/UpdateProfileResponse.dart';
import '../../data/api_service.dart';

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

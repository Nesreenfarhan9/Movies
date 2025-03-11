import 'package:flutter_riverpod/flutter_riverpod.dart';

class ResetPasswordState {
  final bool isLoading;
  final String? errorMessage;

  ResetPasswordState({this.isLoading = false, this.errorMessage});
}

class ResetPasswordNotifier extends StateNotifier<ResetPasswordState> {
  ResetPasswordNotifier() : super(ResetPasswordState());

  Future<void> resetPassword(
      String oldPassword, String newPassword, String confirmPassword) async {
    state = ResetPasswordState(isLoading: true);
    await Future.delayed(const Duration(seconds: 2));

    if (newPassword != confirmPassword) {
      state = ResetPasswordState(errorMessage: 'Passwords do not match');
      return;
    }

    state = ResetPasswordState();
  }
}

final resetPasswordProvider =
    StateNotifierProvider<ResetPasswordNotifier, ResetPasswordState>(
        (ref) => ResetPasswordNotifier());

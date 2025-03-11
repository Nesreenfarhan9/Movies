import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:movies/reset_password_provider.dart';
import 'package:movies/shared/Textfieldwidget.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/custom_elevated_button.dart';

class ResetPasswordScreen extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final resetState = ref.watch(resetPasswordProvider);
    final oldPasswordController = TextEditingController();
    final newPasswordController = TextEditingController();
    final confirmPasswordController = TextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        title: const Text('Reset Password',
            style: TextStyle(color: AppTheme.primary)),
        backgroundColor: AppTheme.black,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: 40),
              Image.asset('assets/images/forgot_password.png', height: 150),
              const SizedBox(height: 40),
              CustomTextField(
                hintText: 'Old Password',
                icon: Icons.lock_outline,
                isPassword: true,
                controller: oldPasswordController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'New Password',
                icon: Icons.lock,
                isPassword: true,
                controller: newPasswordController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'Confirm Password',
                icon: Icons.lock,
                isPassword: true,
                controller: confirmPasswordController,
              ),
              if (resetState.errorMessage != null)
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(resetState.errorMessage!,
                      style: const TextStyle(color: AppTheme.red)),
                ),
              const SizedBox(height: 20),
              CustomElevatedButton(
                lable: 'Reset Password',
                onpressed: resetState.isLoading
                    ? () {}
                    : () {
                        ref.read(resetPasswordProvider.notifier).resetPassword(
                              oldPasswordController.text,
                              newPasswordController.text,
                              confirmPasswordController.text,
                            );
                      },
                widthOfElevatedButton: 1,
                buttonColor: AppTheme.yellow,
                labelColor: AppTheme.black,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

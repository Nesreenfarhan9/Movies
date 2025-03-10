import 'package:flutter/material.dart';
import 'package:movies/shared/Textfieldwidget.dart';
import 'package:movies/shared/custom_elevated_button.dart';

class ResetPasswordScreen extends StatelessWidget {
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Reset Password', style: TextStyle(color: Colors.amber)),
        centerTitle: true ,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.amber),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset('assets/images/forgot_password.png', height: 200),
              const SizedBox(height: 24),
              CustomTextField(
                hintText: 'Old Password',
                icon: Icons.lock_outline,
                isPassword: true,
                controller: oldPasswordController,
              ),
              const SizedBox(height: 16),
              CustomTextField(
                hintText: 'New Password',
                icon: Icons.lock_reset,
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
              const SizedBox(height: 24),
              CustomElevatedButton(
                lable: 'Reset Password',
                onpressed: () => resetPassword(context),
                widthOfElevatedButton: 0.9,
                buttonColor: Colors.amber,
                labelColor: Colors.black,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void resetPassword(BuildContext context) {
    if (newPasswordController.text == confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Password changed successfully!',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.green),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Passwords do not match!',
                style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.red),
      );
    }
  }
}

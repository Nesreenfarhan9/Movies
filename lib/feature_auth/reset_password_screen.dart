import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:movies/shared/app_theme.dart';
import 'package:movies/shared/custom_elevated_button.dart';

import '../shared/Textfieldwidget.dart';

class resetPasswordScreen extends StatefulWidget {
      static const String routeNamed = "/reset";

  @override
  _ChangePasswordScreenState createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<resetPasswordScreen> {
  final _oldPasswordController = TextEditingController();
  final _newPasswordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  Future<void> _changePassword() async {
    if (_newPasswordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('New password and confirmation do not match!')),
      );
      return;
    }

    const url = 'https://yts.mx/api/auth/reset-password';
    const token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NDFkMGFkODZlM2ZmZmlwM2IzOGEwOCIsImVtYWlsIjoiYW1yMjRAZ21haWwuY29tiwiaWF0IjoxNzMyMzY4MDQ1fQ.vhf0NBQzj8EE9AinCX3ezu4yz1R8CNpt8xBawnTyMhw';

    try {
      final response = await http.patch(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'oldPassword': _oldPasswordController.text,
          'newPassword': _newPasswordController.text,
        }),
      );

      if (response.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Password changed successfully!')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Failed to change password.')),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error occurred. Please try again.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
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
                  controller: _oldPasswordController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'New Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _newPasswordController,
                ),
                const SizedBox(height: 16),
                CustomTextField(
                  hintText: 'Confirm Password',
                  icon: Icons.lock,
                  isPassword: true,
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 20),
                CustomElevatedButton(
                  lable: 'Reset Password',
                  onpressed: _changePassword,
                  widthOfElevatedButton: 0.9,
                  buttonColor: AppTheme.yellow,
                  labelColor: AppTheme.black,
                ),
              ],
            ),
          ),
        ));
  }
}

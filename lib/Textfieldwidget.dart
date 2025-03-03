import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  @override
  String hintText;
  IconData icon;
  bool isPassword;
  TextEditingController controller;

  CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: Icon(icon, color: Colors.white),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF282A28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility, color: Colors.white),
                onPressed: () {}, // Implement password visibility toggle later
              )
            : null,
      ),
      style: const TextStyle(color: Colors.white),
    );
  }
}

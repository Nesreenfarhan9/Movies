import 'package:flutter/material.dart';

class CustomTextField extends StatefulWidget {
  @override
  String hintText;
  IconData icon;
  bool isPassword;
  TextEditingController controller;
  AutovalidateMode? autoValidateMode;
  void Function(String)? onChanged;
  TextInputType? keyboardType;
  String? Function(String?)? validator;


  CustomTextField({
    Key? key,
    required this.hintText,
    required this.icon,
    this.isPassword = false,
    required this.controller,
    this.autoValidateMode = AutovalidateMode. onUserInteraction,
    this.onChanged,
    this.keyboardType,
    this.validator,

  }) : super(key: key);

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    TextTheme textTheme = Theme.of(context).textTheme;
    return TextFormField(
      keyboardType:widget. keyboardType,
      onChanged: widget.onChanged,
      autovalidateMode: widget.autoValidateMode,
      controller: widget.controller,
      obscureText: widget.isPassword,
      style: textTheme.titleLarge,
      validator: widget.validator,

      decoration: InputDecoration(
        prefixIcon: Icon(widget.icon, color: Colors.white),
        hintText: widget.hintText,
        hintStyle: const TextStyle(color: Colors.white54),
        filled: true,
        fillColor: Color(0xFF282A28),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none,
        ),
        suffixIcon: widget.isPassword
            ? IconButton(
                icon: const Icon(Icons.visibility, color: Colors.white),
                onPressed: () {}, // Implement password visibility toggle later
              )
            : null,
      ),
    );
  }
}

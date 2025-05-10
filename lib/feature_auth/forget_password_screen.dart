import 'package:flutter/material.dart';

import '../shared/Textfieldwidget.dart';
import '../shared/app_theme.dart';
import '../shared/custom_elevated_button.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});

  static const String routeNamed = 'forget/';

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);
    final TextEditingController forgetPassword = TextEditingController();

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.yellow,
          ),
          onPressed: () {},
        ),
        title: Text('ForgetPassword'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Image.asset(
              'assets/images/forgot_password.png',
              height: screenSize.height * .5,
              width: screenSize.width * 1,
            ),
            CustomTextField(
              hintText: 'Email',
              icon: Icons.email,
              controller: forgetPassword,
            ),
            SizedBox(
              height: 24,
            ),
            CustomElevatedButton(
              lable: "Verify Email",
              onpressed: () {},
              widthOfElevatedButton: screenSize.width * 1,
              buttonColor: AppTheme.yellow,
              labelColor: AppTheme.black,
            )
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/data/models/login_request.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_states.dart';
import 'package:movies/feature_auth/presentation/screens/register_screen.dart';
import 'package:movies/shared/constants.dart';
import 'package:movies/shared/custom_elevated_button.dart';
import 'package:movies/shared/loading_indicator.dart';
import 'package:movies/shared/profile%20_page_screen.dart';

import 'package:movies/shared/app_theme.dart';

import '../../../shared/Textfieldwidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  static const routeNamed = "/login";

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: AppTheme.black,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [

                  Image.asset(
                    'assets/images/iconyellow.png',
                    height: screenSize.height * .1,
                    width: screenSize.width * .25,
                    fit: BoxFit.contain,
                  ),
                  const SizedBox(height: 30),
                  CustomTextField(
                    hintText: "Email",
                    icon: Icons.mail,
                    controller: _emailController,
                    validator: Validation.emailValidator,
                  ),
                  const SizedBox(height: 20),
                  CustomTextField(
                    hintText: "Password",
                    isPassword: true,
                    icon: Icons.lock,
                    controller: _passwordController,
                    validator: Validation.validatePassword,
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () => Navigator.pushNamed(context, 'forget/'),
                      child: const Text("Forget Password?",
                          style: TextStyle(color: AppTheme.yellow)),
                    ),
                  ),
                  const SizedBox(height: 20),
                  BlocListener<AuthCubit, AuthStates>(
                    listener: (_, state) {
                      if (state is LoginLoading) {
                        LoadingIndicator();
                      } else if (state is LoginSuccess) {
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          Navigator.pushReplacementNamed(context, ProfilePageScreen.routeNamed);
                        });
                      }
                      else if(state is LoginError){
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(state.message, style: TextStyle(color: Colors.white))),
                          );
                        });
                      }
                    },
                    child: CustomElevatedButton(
                      widthOfElevatedButton: 1,
                      onpressed: () {
                        if (_formKey.currentState!.validate()) {
                          context.read<AuthCubit>().login(
                                LoginRequest(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                ),
                              );
                        }
                      },
                      lable: 'Login',
                      buttonColor: AppTheme.yellow,
                      labelColor: AppTheme.black,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Don't Have an Account?",
                          style: TextStyle(color: AppTheme.primary)),
                      TextButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, RegisterScreen.routeNamed);
                        },
                        child: const Text("Create One",
                            style: TextStyle(color: AppTheme.yellow)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    children: const [
                      Expanded(child: Divider(color: AppTheme.yellow)),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10),
                        child: Text("OR",
                            style: TextStyle(color: AppTheme.yellow)),
                      ),
                      Expanded(child: Divider(color: AppTheme.yellow)),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton.icon(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.g_mobiledata_outlined,
                        color: AppTheme.black,
                        size: 35,
                      ),
                      label: const Text("Login With Google",
                          style: TextStyle(color: AppTheme.black)),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppTheme.yellow,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Container(
                    width: screenSize.width*.2,
                    height: screenSize.height*0.05,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppTheme.yellow, width: 2),
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.transparent,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset('assets/images/US.png', height: 30, fit: BoxFit.scaleDown),
                        Image.asset('assets/images/EGYPT.png', height: 30,fit: BoxFit.scaleDown),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

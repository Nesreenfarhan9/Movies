import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/data/models/register_request.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_cubit.dart';
import 'package:movies/feature_auth/presentation/cubit/auth_states.dart';
import 'package:movies/feature_auth/presentation/view_model/avtar_model.dart';
import 'package:movies/shared/ShowItem.dart';

import '../../../shared/Textfieldwidget.dart';
import '../../../shared/app_theme.dart';
import '../../../shared/constants.dart';
import '../../../shared/custom_elevated_button.dart';

import '../../../shared/loading_indicator.dart';
import '../../../shared/profile _page_screen.dart';

class RegisterScreen extends StatefulWidget {
  static const String routeNamed = "/register";

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  int _selectedAvatarId = AvatarModel.avatars.first.id;

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    final TextTheme textTheme = Theme.of(context).textTheme;

    return Scaffold(
      backgroundColor: AppTheme.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: AppTheme.yellow,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Register'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 19),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CarouselSlider.builder(
                  itemCount: AvatarModel.avatars.length,
                  itemBuilder: (_, index, __) =>
                      ShowItem(avatar: AvatarModel.avatars[index]),
                  options: CarouselOptions(
                    onPageChanged: (index, _) {
                      _selectedAvatarId = AvatarModel.avatars[index].id;
                    },
                    enlargeCenterPage: true,
                    enlargeFactor: 0.6,
                    viewportFraction: 0.4,
                  ),
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Name',
                  icon: Icons.person,
                  controller: _nameController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Name is required';
                    }
                    if (value.length < 3) {
                      return 'Name is too short';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Email',
                  icon: Icons.email,
                  controller: _emailController,
                  validator: Validation.emailValidator,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Password',
                  isPassword: true,
                  icon: Icons.lock,
                  controller: _passwordController,
                  validator: Validation.validatePassword,
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Confirm Password',
                  isPassword: true,
                  icon: Icons.lock,
                  controller: _confirmPasswordController,
                  validator: (value) {
                    if (value == null || value.isEmpty)
                      return 'Password is required';
                    if (value != _passwordController.text)
                      return 'Passwords do not match';
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                CustomTextField(
                  hintText: 'Phone Number',
                  icon: Icons.phone,
                  controller: _phoneController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone number is required';
                    }
                    if (!RegExp(r'^\+?[0-9]{10,15}$').hasMatch(value)) {
                      return 'Enter a valid phone number (10-15 digits)';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 15),
                BlocListener<AuthCubit, AuthStates>(
                  listener: (BuildContext context, state) {
                    if (state is RegisterLoading) {
                      LoadingIndicator();
                    } else if (state is RegisterSuccess) {
                      Navigator.pushReplacementNamed(
                          context, ProfilePageScreen.routeNamed);
                    } else if (state is RegisterError) {
                      print(state.message);
                    }
                  },
                  child: CustomElevatedButton(
                    lable: 'Create Account',
                    onpressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.read<AuthCubit>().register(RegisterRequest(
                              name: _nameController.text,
                              email: _emailController.text,
                              password: _passwordController.text,
                              confirmPassword: _confirmPasswordController.text,
                              phone: _phoneController.text,
                              avaterId: _selectedAvatarId,
                            ));
                      }
                    },
                    widthOfElevatedButton: screenSize.width,
                    buttonColor: AppTheme.yellow,
                    labelColor: AppTheme.gray,
                  ),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Already Have an Account? ',
                        style: textTheme.titleSmall),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: AppTheme.yellow),
                      ),
                    ),
                  ],
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
    );
  }

  void register() {
    print(_selectedAvatarId);
    if (_formKey.currentState!.validate()) {
      print('Register');
    } else {
      print('Not Valid');
    }
  }
}

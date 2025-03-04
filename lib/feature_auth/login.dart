import 'package:flutter/material.dart';
import '../shared/Textfieldwidget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Color Yellow = const Color(0xFFFFBB3B);
    static const routeNamed = "/login";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF121312),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              Image.asset('assets/images/iconyellow.png', height: 118, width: 121,),

              const SizedBox(height: 30),

              CustomTextField(
                hintText: "Email",
                icon: Icons.email,
                controller: emailController,
              ),

              const SizedBox(height: 20),

              // Password Input
              CustomTextField(
                hintText: "Password",
                icon: Icons.lock,
                isPassword: true,
                controller: passwordController,
              ),

              const SizedBox(height: 10),


              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    "Forget Password?",
                    style: TextStyle(color: Color(0xFFFFBB3B)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Login Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {

                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Yellow,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                  child: const Text("Login", style: TextStyle(color: Colors.black, fontSize: 18)),
                ),
              ),

              const SizedBox(height: 20),

              // Sign Up Link
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't Have an Account?", style: TextStyle(color: Colors.white)),
                  TextButton(
                    onPressed: () {}, // Navigate to sign-up screen
                    child: const Text("Create One", style: TextStyle(color: Color(0xFFFFBB3B))),
                  ),
                ],
              ),

              const SizedBox(height: 10),

              // OR Divider
              Row(
                children: const [
                  Expanded(child: Divider(color: Color(0xFFFFBB3B))),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10),
                    child: Text("OR", style: TextStyle(color: Color(0xFFFFBB3B))),
                  ),
                  Expanded(child: Divider(color: Color(0xFFFFBB3B))),
                ],
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                  },
                  icon: const Icon(Icons.g_mobiledata_outlined, color: Colors.black, size: 35,),
                  label: const Text("Login With Google", style: TextStyle(color: Colors.black)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Yellow,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),

              const SizedBox(height: 20),
              Stack(
                children: [
              Container(
                width: 115,
                height: 40,
                decoration: BoxDecoration(
                  border: Border.all(color: Color(0xFFFFBB3B), width: 2),
                  borderRadius: BorderRadius.circular(25),
                  color: Colors.transparent,
                ),
                child:
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('assets/images/US.png',),
                  const SizedBox(width: 2),
                  Image.asset('assets/images/EGYPT.png',),
                ],
              ),
              )],
              )] ) ),
        ),
    );
  }
}

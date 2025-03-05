import 'package:flutter/material.dart';


class RegisterScreen extends StatefulWidget {
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedAvatarIndex = 0;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  final List<String> avatars = [
    'assets/images/avatar1.png',
    'assets/images/avatar2.png',
    'assets/images/avatar3.png',
    'assets/images/avatar4.png',
    'assets/images/avatar5.png',
    'assets/images/avatar6.png',
  ];

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: const Icon(Icons.arrow_back, color: Colors.yellow),
        title: const Text('Register', style: TextStyle(color: Colors.yellow)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 130,
              child: Center(
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemCount: avatars.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 10),
                  itemBuilder: (context, index) {
                    bool isSelected = selectedAvatarIndex == index;
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              selectedAvatarIndex = index;
                            });
                          },
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 300),
                            curve: Curves.easeInOut,
                            width: isSelected ? 100 : 70,
                            height: isSelected ? 100 : 70,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                  color: isSelected
                                      ? Colors.yellow
                                      : Colors.transparent,
                                  width: 3),
                              image: DecorationImage(
                                image: AssetImage(avatars[index]),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 2),
                        const Text('Avatar',
                            style:
                                TextStyle(color: Colors.white, fontSize: 12)),
                      ],
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(Icons.person, 'Name'),
            const SizedBox(height: 10),
            _buildTextField(Icons.email, 'Email'),
            const SizedBox(height: 10),
            _buildPasswordField('Password', isPasswordVisible, () {
              setState(() {
                isPasswordVisible = !isPasswordVisible;
              });
            }),
            const SizedBox(height: 10),
            _buildPasswordField('Confirm Password', isConfirmPasswordVisible,
                () {
              setState(() {
                isConfirmPasswordVisible = !isConfirmPasswordVisible;
              });
            }),
            const SizedBox(height: 10),
            _buildTextField(Icons.phone, 'Phone Number'),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {},
              child: const Text('Create Account',
                  style: TextStyle(color: Colors.black)),
            ),
            const SizedBox(height: 10),
            const Text('Already Have Account ? ',
                style: TextStyle(color: Colors.white)),
            TextButton(
              onPressed: () {},
              child:
                  const Text('Login', style: TextStyle(color: Colors.yellow)),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/flags/us.png', width: 30),
                const SizedBox(width: 10),
                Image.asset('assets/flags/eg.png', width: 30),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(IconData icon, String hint,
      {bool obscureText = false}) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: obscureText,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: Icon(icon, color: Colors.white54),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildPasswordField(
      String hint, bool isVisible, VoidCallback toggleVisibility) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      obscureText: !isVisible,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white54),
        prefixIcon: const Icon(Icons.lock, color: Colors.white54),
        suffixIcon: IconButton(
          icon: Icon(
            isVisible ? Icons.visibility : Icons.visibility_off,
            color: Colors.white54,
          ),
          onPressed: toggleVisibility,
        ),
        filled: true,
        fillColor: Colors.white10,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}

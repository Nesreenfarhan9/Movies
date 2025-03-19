import 'package:flutter/material.dart';
import 'package:movies/feature_auth/presentation/screens/login.dart';
import 'package:movies/services/api_service.dart';
import 'package:movies/services/UpdateProfileRequest.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies/feature_auth/presentation/cubit/UpdateProfileCubit.dart';
import 'package:movies/services/shared_prefs_helper.dart';

class Update extends StatefulWidget {
  static const String routeNamed = "/update-profile";

  const Update({super.key});

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int selectedAvatarId = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => UpdateProfileCubit(ApiService()),
      child: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.yellow),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title:
              const Text('Pick Avatar', style: TextStyle(color: Colors.yellow)),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              GestureDetector(
                onTap: () async {
                  int? avatarId = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => AvatarSelectionScreen()),
                  );
                  if (avatarId != null) {
                    setState(() {
                      selectedAvatarId = avatarId;
                    });
                  }
                },
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage:
                      AssetImage('assets/images/avatar$selectedAvatarId.png'),
                ),
              ),
              const SizedBox(height: 20),
              _buildTextField(nameController, 'John Safwat', Icons.person),
              const SizedBox(height: 10),
              _buildTextField(phoneController, '01200000000', Icons.phone,
                  TextInputType.phone),
              const SizedBox(height: 10),
              Align(
                alignment: Alignment.centerLeft,
                child: TextButton(
                  onPressed: () {},
                  child: const Text('Reset Password',
                      style: TextStyle(color: Colors.yellow)),
                ),
              ),
              const SizedBox(height: 20),
              const Spacer(),
              BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
                listener: (context, state) {
                  if (state is UpdateProfileSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text(
                              "Profile updated successfully: ${state.response.message}")),
                    );
                    Navigator.pop(context);
                  } else if (state is UpdateProfileFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Failed to update profile: ${state.error}")),
                    );
                  } else if (state is DeleteProfileSuccess) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                          content: Text("Profile deleted successfully")),
                    );
                    Navigator.pushNamedAndRemoveUntil(
                        context, LoginScreen.routeNamed, (route) => false);
                  } else if (state is DeleteProfileFailure) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text("Failed to delete profile: ${state.error}")),
                    );
                  }
                },
                builder: (context, state) {
                  return Column(
                    children: [
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.red,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: state is UpdateProfileLoading
                            ? null
                            : () {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: const Text("Confirm Deletion"),
                                    content: const Text(
                                        "Are you sure you want to delete your account? This action cannot be undone."),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: const Text("Cancel",
                                            style:
                                                TextStyle(color: Colors.black)),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          Navigator.pop(context);
                                          String token =
                                              (await SharedPrefsHelper
                                                  .getToken())!;
                                          context
                                              .read<UpdateProfileCubit>()
                                              .deleteProfile(token);
                                        },
                                        child: const Text("Delete",
                                            style:
                                                TextStyle(color: Colors.red)),
                                      ),
                                    ],
                                  ),
                                );
                              },
                        child: const Text('Delete Account',
                            style: TextStyle(color: Colors.white)),
                      ),
                      const SizedBox(height: 10),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.yellow,
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: state is UpdateProfileLoading
                            ? null
                            : () {
                                final request = UpdateProfileRequest(
                                  email: "user@example.com",
                                  avatarId: selectedAvatarId,
                                  name: nameController.text.trim().isNotEmpty
                                      ? nameController.text.trim()
                                      : null,
                                  phone: phoneController.text.trim().isNotEmpty
                                      ? phoneController.text.trim()
                                      : null,
                                );
                                context.read<UpdateProfileCubit>().updateProfile(
                                    request,
                                    "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3YjkwYzRiZjFkZGFjMWRhYzEzMDYwNCIsImVtYWlsIjoiYW1yMkBnbWFpbC5jb20iLCJpYXQiOjE3NDE3Mzg1MjZ9.5_lyzog_g6AukKAU4UFk8-Q3rM2Fn9ZffTKcCTUuMTY");
                              },
                        child: state is UpdateProfileLoading
                            ? const CircularProgressIndicator(
                                color: Colors.black)
                            : const Text('Update Data',
                                style: TextStyle(color: Colors.black)),
                      ),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, IconData icon,
      [TextInputType type = TextInputType.text]) {
    return TextField(
      controller: controller,
      style: const TextStyle(color: Colors.white),
      keyboardType: type,
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
}

class AvatarSelectionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title:
            const Text('Select Avatar', style: TextStyle(color: Colors.yellow)),
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(16.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 1,
        ),
        itemCount: 9,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              Navigator.pop(context, index + 1);
            },
            child: Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.yellow, width: 2),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white10,
                backgroundImage:
                    AssetImage('assets/images/avatar${index + 1}.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}

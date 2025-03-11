import 'package:flutter/material.dart';
import 'package:movies/services/api_service.dart';

class Update extends StatefulWidget {
  static const String routeNamed = "/update-profile";

  @override
  _UpdateState createState() => _UpdateState();
}

class _UpdateState extends State<Update> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  int selectedAvatarId = 1;
  bool isLoading = false;

  Future<void> _updateProfile() async {
    setState(() {
      isLoading = true;
    });

    ApiService apiService = ApiService();
    bool success = await apiService.updateProfile(
      nameController.text.trim(),
      phoneController.text.trim(),
      selectedAvatarId,
    );

    setState(() {
      isLoading = false;
    });

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(success ? "Profile updated successfully!" : "Failed to update profile. Try again.")),
    );

    if (success) {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text('Pick Avatar', style: TextStyle(color: Colors.yellow)),
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
                  MaterialPageRoute(builder: (context) => AvatarSelectionScreen()),
                );
                if (avatarId != null) {
                  setState(() {
                    selectedAvatarId = avatarId;
                  });
                }
              },
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/avatar$selectedAvatarId.png'),
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: nameController,
              style: TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'John Safwat',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.person, color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: phoneController,
              style: TextStyle(color: Colors.white),
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                hintText: '01200000000',
                hintStyle: TextStyle(color: Colors.white54),
                prefixIcon: Icon(Icons.phone, color: Colors.white54),
                filled: true,
                fillColor: Colors.white10,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: 10),
            Align(
              alignment: Alignment.centerLeft,
              child: TextButton(
                onPressed: () {},
                child: Text('Reset Password', style: TextStyle(color: Colors.yellow)),
              ),
            ),
            const SizedBox(height: 20),
            Spacer(),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: () {
                // Implement Delete Account Functionality
              },
              child: const Text('Delete Account', style: TextStyle(color: Colors.white)),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                minimumSize: Size(double.infinity, 50),
              ),
              onPressed: _updateProfile,
              child: const Text('Update Data', style: TextStyle(color: Colors.black)),
            ),
          ],
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
        title: const Text('Select Avatar', style: TextStyle(color: Colors.yellow)),
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
                backgroundImage: AssetImage('assets/images/avatar${index + 1}.png'),
              ),
            ),
          );
        },
      ),
    );
  }
}

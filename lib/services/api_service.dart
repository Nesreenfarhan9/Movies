import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = "https://route-movie-apis.vercel.app/";
  final String token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjY3NDFkMGFkODZlM2ZmZmIwM2IzOGEwOCIsImVtYWlsIjoiYW1yMjRAZ21haWwuY29tIiwiaWF0IjoxNzMyMzY4MDQ1fQ.vhf0NBQzj8EE9AinCX3ezu4yz1R8CNpt8xBawnTyMhw";

  Future<bool> updateProfile(String name, String phone, int avatarId) async {
    final response = await http.put(
      Uri.parse('$baseUrl/update-profile/'),
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $token", // Added Authorization
      },
      body: jsonEncode({"name": name, "phone": phone, "avatarId": avatarId}),
    );
    

    if (response.statusCode == 200 || response.statusCode == 201) {
      print("Profile updated successfully: ${response.body}");
      return true;
    } else {
      print("Failed to update profile: ${response.statusCode} - ${response.body}");
      return false;
    }
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lgbtq_social_media/functions/api.dart';

class AuthFunctions {
  static Future<bool> signupNewUser({
    required String name,
    required String username,
    required String email,
    required String password,
    required String gender,
  }) async {
    final url = Uri.parse("$apiUrl/auth/signup");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          "name": name,
          "username": username,
          "email": email,
          "password": password,
          "gender": gender,
        },
      ),
    );
    final responseMap = jsonDecode(response.body);
    final status = responseMap["status"];
    if (status == "success") {
      return true;
    }
    return false;
  }

  static Future<String> loginUser({
    required String email,
    required String password,
  }) async {
    final url = Uri.parse("$apiUrl/auth/login");
    final response = await http.post(
      url,
      headers: {
        'Content-Type': 'application/json',
      },
      body: json.encode(
        {
          "email": email,
          "password": password,
        },
      ),
    );
    final responseMap = json.decode(response.body);
    final status = responseMap["status"];
    if (status == "success") {
      return responseMap["token"];
    }
    return responseMap['message'];
  }

  static Future<bool> completeProfileSetup({
    String? bio,
    String? name,
    String? username,
    String? profileImageUrl,
    String? coverImageUrl,
    String? country,
    String? dob,
    bool? isPrivate,
    required String token,
  }) async {
    final url = Uri.parse("$apiUrl/user/profile/update");
    final response = await http.put(
      url,
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: json.encode(
        {
          "name": name,
          "username": username,
          "bio": bio,
          "profileImageURL": profileImageUrl,
          "coverImageURL": coverImageUrl,
          "dob": dob,
          "country": country,
          "isPrivate": isPrivate,
        },
      ),
    );
    final responseMap = json.decode(response.body);
    if (responseMap['status'] == "success") {
      return true;
    }
    return false;
  }
}

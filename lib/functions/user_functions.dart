import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lgbtq_social_media/functions/api.dart';
import 'package:lgbtq_social_media/models/user_model.dart';

class UserFunctions {
  static Future<List<Map<String, dynamic>>> getAllUsers() async {
    final response = await http.get(
      Uri.parse("$apiUrl/users"),
    );
    final data = json.decode(response.body);
    final List<Map<String, dynamic>> users = data["data"];
    return users;
  }

  static Future<Map<String, dynamic>> getProfile(String token) async {
    final response = await http.get(
      Uri.parse("$apiUrl/user/profile"),
      headers: {
        "token": token,
      },
    );
    final data = json.decode(response.body);
    final UserModel user = data["data"];
    return user.toMap();
  }

  static Future<void> updateProfile(String token,
      {required UserModel userData}) async {
    await http.put(
      Uri.parse("$apiUrl/user/profile/update"),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: userData.toJson(),
    );
  }

  static Future<UserModel> searchProfile(
    String token,
    String username,
  ) async {
    final response = await http.get(
      Uri.parse("$apiUrl/user/search/$username"),
      headers: {
        "token": token,
      },
    );
    final data = json.decode(response.body);
    final UserModel user = data["data"];
    return user;
  }

  static Future<void> followProfile(
    String token,
    String id,
  ) async {
    await http.put(
      Uri.parse("$apiUrl/user/follow/$id"),
      headers: {
        "token": token,
      },
    );
  }

  static Future<void> unfollowProfile(
    String token,
    String id,
  ) async {
    await http.put(
      Uri.parse("$apiUrl/user/unfollow/$id"),
      headers: {
        "token": token,
      },
    );
  }
}

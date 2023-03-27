import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lgbtq_social_media/functions/api.dart';
import 'package:lgbtq_social_media/models/user_model.dart';

class UserFunctions {
  static Future<UserModel> fetchUserData({required String token}) async {
    UserModel user = UserModel.newUser;
    final url = Uri.parse("$apiUrl/user/profile");
    final response = await http.get(
      url,
      headers: {
        "token": token,
      },
    );
    final responseMap = json.decode(response.body);
    print(responseMap);
    return user;
  }
}

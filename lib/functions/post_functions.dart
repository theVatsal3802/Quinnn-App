import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lgbtq_social_media/functions/api.dart';

class PostFunctions {
  static Future<List<Map<String, dynamic>>> getAllPosts({
    required int page,
    int limit = 10,
    String sort = "popular",
  }) async {
    final response = await http.get(
      Uri.parse("$apiUrl/posts"),
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> posts = data["data"];
    return posts;
  }

  static Future<void> createPost({
    required String token,
    required Map<String, dynamic> post,
  }) async {
    await http.post(
      Uri.parse("$apiUrl/post/create"),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: post,
    );
  }

  static Future<void> updatePost({
    required String token,
    required String text,
    required String postId,
  }) async {
    await http.put(
      Uri.parse("$apiUrl/post/update/$postId"),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: {
        "text": text,
      },
    );
  }

  static Future<void> deletePost({
    required String token,
    required String postId,
  }) async {
    await http.delete(
      Uri.parse("$apiUrl/post/delete/$postId?postId=$postId"),
      headers: {
        "token": token,
      },
    );
  }

  static Future<void> likePost({
    required String token,
    required String postId,
  }) async {
    await http.put(
      Uri.parse("$apiUrl/post/like/$postId?postId=$postId"),
      headers: {
        "token": token,
      },
    );
  }

  static Future<void> unlikePost({
    required String token,
    required String postId,
  }) async {
    await http.put(
      Uri.parse("$apiUrl/post/unlike/$postId?postId=$postId"),
      headers: {
        "token": token,
      },
    );
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:lgbtq_social_media/functions/api.dart';
import 'package:lgbtq_social_media/models/event_model.dart';

class EventFunctions {
  static Future<List<Map<String, dynamic>>> getEvents(
    int page,
    int limit,
    String sort,
  ) async {
    final response = await http.get(
      Uri.parse("$apiUrl/events?page=$page&sort=$sort&limit=$limit"),
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> events = [];
    if (data["status"] == "success") {
      for (var element in data["events"]) {
        events.add(element);
      }
    }
    return events;
  }

  static Future<List<Map<String, dynamic>>> getUpcomingEvents() async {
    final response = await http.get(
      Uri.parse("$apiUrl/event/upcoming"),
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> events = [];
    if (data["status"] == "success") {
      for (var element in data["events"]) {
        events.add(element);
      }
    }
    return events;
  }

  static Future<List<Map<String, dynamic>>> getPastEvents() async {
    final response = await http.get(
      Uri.parse("$apiUrl/event/past"),
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> events = [];
    if (data["status"] == "success") {
      for (var element in data["events"]) {
        events.add(element);
      }
    }
    return events;
  }

  static Future<List<Map<String, dynamic>>> getOngoingEvents() async {
    final response = await http.get(
      Uri.parse("$apiUrl/event/ongoing"),
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> events = [];
    if (data["status"] == "success") {
      for (var element in data["events"]) {
        events.add(element);
      }
    }
    return events;
  }

  static Future<List<Map<String, dynamic>>> getMyEvents(String token) async {
    final response = await http.get(
      Uri.parse("$apiUrl/event/myevents"),
      headers: {
        "token": token,
      },
    );
    final data = json.decode(response.body);
    List<Map<String, dynamic>> events = [];
    if (data["status"] == "success") {
      for (var element in data["events"]) {
        events.add(element);
      }
    }
    return events;
  }

  static Future<void> createNewEvent({
    required EventModel event,
    required String token,
  }) async {
    await http.post(
      Uri.parse("$apiUrl/event/create"),
      headers: {
        "Content-Type": "application/json",
        "token": token,
      },
      body: json.encode(event.toMap()),
    );
  }
}

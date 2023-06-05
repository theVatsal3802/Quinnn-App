// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class EventModel {
  final String id;
  final String eventTitle;
  final String eventDescription;
  final String eventLocation;
  final bool isOnlineEvent;
  final String? eventUrl;
  final DateTime eventDateAndTime;
  final String? eventImageUrl;
  final DateTime creationDate;

  EventModel({
    required this.id,
    required this.eventTitle,
    required this.eventDescription,
    required this.eventLocation,
    required this.isOnlineEvent,
    required this.eventDateAndTime,
    this.eventImageUrl,
    this.eventUrl,
    required this.creationDate,
  });

  static List<EventModel> dummyEvents = [
    EventModel(
      id: "1",
      eventTitle: "ABCD",
      eventDescription:
          "If you truly love nature, you will find beauty everywhere.",
      eventLocation: "Jaipur, India",
      eventDateAndTime: DateTime.now(),
      creationDate: DateTime.now(),
      isOnlineEvent: false,
      eventImageUrl: "",
      eventUrl: "",
    ),
    EventModel(
      id: "2",
      eventTitle: "ABCDE",
      eventDescription:
          "If you truly love nature, you will find beauty everywhere. Yes thats true",
      eventLocation: "Jaipur, India, Earth",
      eventDateAndTime: DateTime.now(),
      creationDate: DateTime.now(),
      isOnlineEvent: true,
      eventImageUrl:
          "https://images.pexels.com/photos/4818015/pexels-photo-4818015.jpeg?auto=compress&cs=tinysrgb&w=1600",
      eventUrl: "https://meet.google.com/",
    ),
  ];

  EventModel copyWith({
    String? id,
    String? eventTitle,
    String? eventDescription,
    String? eventLocation,
    bool? isOnlineEvent,
    String? eventUrl,
    DateTime? eventDateAndTime,
    String? eventImageUrl,
    DateTime? creationDate,
  }) {
    return EventModel(
      id: id ?? this.id,
      eventTitle: eventTitle ?? this.eventTitle,
      eventDescription: eventDescription ?? this.eventDescription,
      eventLocation: eventLocation ?? this.eventLocation,
      isOnlineEvent: isOnlineEvent ?? this.isOnlineEvent,
      eventUrl: eventUrl ?? this.eventUrl,
      eventDateAndTime: eventDateAndTime ?? this.eventDateAndTime,
      eventImageUrl: eventImageUrl ?? this.eventImageUrl,
      creationDate: creationDate ?? this.creationDate,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'eventTitle': eventTitle,
      'eventDescription': eventDescription,
      'eventLocation': eventLocation,
      'isOnlineEvent': isOnlineEvent,
      'eventUrl': eventUrl,
      'eventDateAndTime': eventDateAndTime.millisecondsSinceEpoch,
      'eventImageUrl': eventImageUrl,
      'creationDate': creationDate.millisecondsSinceEpoch,
    };
  }

  factory EventModel.fromMap(Map<String, dynamic> map) {
    return EventModel(
      id: map['id'] as String,
      eventTitle: map['eventTitle'] as String,
      eventDescription: map['eventDescription'] as String,
      eventLocation: map['eventLocation'] as String,
      isOnlineEvent: map['isOnlineEvent'] as bool,
      eventUrl: map['eventUrl'] != null ? map['eventUrl'] as String : null,
      eventDateAndTime:
          DateTime.fromMillisecondsSinceEpoch(map['eventDateAndTime'] as int),
      eventImageUrl:
          map['eventImageUrl'] != null ? map['eventImageUrl'] as String : null,
      creationDate:
          DateTime.fromMillisecondsSinceEpoch(map['creationDate'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory EventModel.fromJson(String source) =>
      EventModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'EventModel(id: $id, eventTitle: $eventTitle, eventDescription: $eventDescription, eventLocation: $eventLocation, isOnlineEvent: $isOnlineEvent, eventUrl: $eventUrl, eventDateAndTime: $eventDateAndTime, eventImageUrl: $eventImageUrl, creationDate: $creationDate)';
  }
}

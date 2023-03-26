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
}

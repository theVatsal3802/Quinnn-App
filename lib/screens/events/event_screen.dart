import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/event_model.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';

class EventScreen extends StatefulWidget {
  static const routeName = "/events";
  const EventScreen({super.key});

  @override
  State<EventScreen> createState() => _EventScreenState();
}

class _EventScreenState extends State<EventScreen> {
  final events = EventModel.dummyEvents;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "Upcoming events",
          textScaleFactor: 1,
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: events.length,
          itemBuilder: (context, index) {
            return const ListTile(
              tileColor: Colors.green,
            );
          },
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/event_model.dart';
import 'package:lgbtq_social_media/screens/events/add_event_screen.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';
import 'package:lgbtq_social_media/widgets/event_box.dart';

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
          "Events",
          textScaleFactor: 1,
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed(AddEventScreen.routeName);
        },
        tooltip: "Add new event",
        child: const Icon(Icons.add),
      ),
      body: RefreshIndicator(
        onRefresh: () async {},
        child: ListView.builder(
          shrinkWrap: true,
          itemCount: events.length,
          itemBuilder: (context, index) {
            return EventBox(
              event: events[index],
            );
          },
        ),
      ),
    );
  }
}

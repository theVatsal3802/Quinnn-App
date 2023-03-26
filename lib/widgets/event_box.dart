import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/models/event_model.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';
import 'package:url_launcher/url_launcher.dart';

class EventBox extends StatelessWidget {
  final EventModel event;
  const EventBox({
    super.key,
    required this.event,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(vertical: 20),
      color: ColorManager.baseWhiteColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 20,
              right: 20,
              top: 5,
              bottom: 10,
            ),
            child: Text(
              event.eventTitle,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    fontSize: 20,
                  ),
            ),
          ),
          if (event.eventImageUrl != null && event.eventImageUrl!.isNotEmpty)
            Image.network(
              event.eventImageUrl!,
              height: 200,
              width: double.infinity,
              fit: BoxFit.fill,
            ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Text(
              event.eventDescription,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 5,
            ),
            child: Row(
              children: [
                const Icon(Icons.location_on),
                Text(
                  event.isOnlineEvent ? "Online" : event.eventLocation,
                  textScaleFactor: 1,
                ),
                const Spacer(),
                const Icon(Icons.calendar_month),
                Text(
                  ParseFunctions.getDateFromDateTime(
                    date: event.eventDateAndTime,
                    isTimeNeeded: true,
                  ),
                  textScaleFactor: 1,
                ),
              ],
            ),
          ),
          if (event.isOnlineEvent)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 5,
              ),
              child: Row(
                children: [
                  const Icon(Icons.link),
                  TextButton(
                    onPressed: () {
                      final url = Uri.parse(event.eventUrl ?? "");
                      launchUrl(
                        url,
                        mode: LaunchMode.platformDefault,
                      );
                    },
                    child: const Text(
                      "Event Link",
                      textScaleFactor: 1,
                    ),
                  ),
                ],
              ),
            ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              ParseFunctions.getDateFromDateTime(
                date: event.creationDate,
                isTimeNeeded: true,
              ),
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: ColorManager.baseDarkGreyColor,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}

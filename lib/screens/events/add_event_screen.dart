import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/parse_functions.dart';

class AddEventScreen extends StatefulWidget {
  static const routeName = "/add-event";
  const AddEventScreen({super.key});

  @override
  State<AddEventScreen> createState() => _AddEventScreenState();
}

class _AddEventScreenState extends State<AddEventScreen> {
  final GlobalKey<FormState> _formkey = GlobalKey();
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final urlController = TextEditingController();
  bool isOnline = false;
  String image = "";
  String date = "";
  String time = "";

  void selectDate() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    ).then(
      (value) {
        setState(() {
          if (value != null) {
            date = ParseFunctions.getDateFromDateTime(
              date: value,
              isTimeNeeded: false,
            );
          }
        });
      },
    );
  }

  void selectTime() {
    showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    ).then(
      (value) {
        setState(() {
          if (value != null) {
            String hours = ParseFunctions.setPrecision(
              number: value.hour.toString(),
            );
            String minutes = ParseFunctions.setPrecision(
              number: value.minute.toString(),
            );
            time = "$hours:$minutes";
          }
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add New Event",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              TextFormField(
                enableSuggestions: true,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                controller: titleController,
                decoration: const InputDecoration(
                  labelText: "Event title",
                  prefixIcon: Icon(Icons.event),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                enableSuggestions: true,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                maxLines: 4,
                controller: descriptionController,
                decoration: const InputDecoration(
                  labelText: "Event description",
                  prefixIcon: Icon(Icons.description),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormField(
                enableSuggestions: true,
                textCapitalization: TextCapitalization.sentences,
                autocorrect: true,
                controller: locationController,
                decoration: const InputDecoration(
                  labelText: "Event location",
                  prefixIcon: Icon(Icons.location_on),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CheckboxListTile(
                title: const Text(
                  "Is Event online?",
                  textScaleFactor: 1,
                ),
                value: isOnline,
                onChanged: (value) {
                  setState(() {
                    isOnline = value!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              if (isOnline)
                TextFormField(
                  enableSuggestions: true,
                  textCapitalization: TextCapitalization.sentences,
                  autocorrect: true,
                  controller: urlController,
                  decoration: const InputDecoration(
                    labelText: "Event url",
                    prefixIcon: Icon(Icons.link),
                  ),
                ),
              const SizedBox(
                height: 20,
              ),
              ListTile(
                leading: const Icon(Icons.calendar_month),
                title: const Text(
                  "Event Date",
                  textScaleFactor: 1,
                ),
                subtitle: Text(
                  date.isEmpty ? "Select date" : date,
                  textScaleFactor: 1,
                ),
                onTap: selectDate,
              ),
              ListTile(
                leading: const Icon(Icons.alarm),
                title: const Text(
                  "Event Time",
                  textScaleFactor: 1,
                ),
                subtitle: Text(
                  time.isEmpty ? "Select time" : time,
                  textScaleFactor: 1,
                ),
                onTap: selectTime,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Add Image from gallery",
                  textScaleFactor: 1,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              OutlinedButton(
                onPressed: () {},
                child: const Text(
                  "Add Image from camera",
                  textScaleFactor: 1,
                ),
              ),
              if (image.isNotEmpty)
                Image.network(
                  image,
                  height: 200,
                  width: double.infinity,
                  fit: BoxFit.fill,
                ),
              ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Add Event",
                  textScaleFactor: 1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

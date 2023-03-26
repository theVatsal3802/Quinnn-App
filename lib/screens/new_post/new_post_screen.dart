import 'package:flutter/material.dart';

class NewPostScreen extends StatefulWidget {
  static const routeName = "/new-post";
  const NewPostScreen({super.key});

  @override
  State<NewPostScreen> createState() => _NewPostScreenState();
}

class _NewPostScreenState extends State<NewPostScreen> {
  final String caption = "";
  final captionController = TextEditingController();
  final String image = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Post",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: captionController,
              decoration: const InputDecoration(
                labelText: "Caption",
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.image),
              label: const Text(
                "Add Image from Gallery",
                textScaleFactor: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: () {},
              icon: const Icon(Icons.camera),
              label: const Text(
                "Take picture from camera",
                textScaleFactor: 1,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            if (image.isNotEmpty)
              Image.network(
                image,
                height: 200,
                width: double.infinity,
                fit: BoxFit.fill,
              ),
          ],
        ),
      ),
    );
  }
}

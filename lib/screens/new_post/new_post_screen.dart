import 'package:flutter/material.dart';

class NewPostScreen extends StatelessWidget {
  static const routeName = "/new-post";
  const NewPostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "New Post",
          textScaleFactor: 1,
        ),
      ),
    );
  }
}

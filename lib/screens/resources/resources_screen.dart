import 'package:flutter/material.dart';

class ResourcesScreen extends StatelessWidget {
  static const routeName = "/resources";
  const ResourcesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Resources",
          textScaleFactor: 1,
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';

class AboutTheAppScreen extends StatelessWidget {
  static const routeName = "/about-app";
  const AboutTheAppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "About ${AssetManager.appName}",
          textScaleFactor: 1,
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Welcome to our LGBTQ Social Media app ${AssetManager.appName}",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              "We are a community-driven platform that aims to create a safe and inclusive space for all members of the LGBTQ community. Our mission is to connect individuals from all over the world, fostering meaningful relationships and providing a platform for expression, support, and activism. \nWe understand that the LGBTQ community is diverse and intersectional, which is why we prioritize inclusivity and respect for all gender identities, sexual orientations, and cultural backgrounds. Our app is a space where you can connect with others who share similar experiences, interests, and struggles. Whether you're looking for friends, romance, or just a supportive community, we've got you covered. \nOur app offers a variety of features to help you connect with others, including messaging, forums, and groups dedicated to specific interests or identities. We also regularly organize events and campaigns to raise awareness and promote activism for LGBTQ rights and issues. \nWe take your privacy and safety seriously, which is why our app includes robust security features and a reporting system for any incidents of harassment or abuse. Our team is committed to creating a safe and supportive community, and we encourage all members to uphold our values of respect and inclusivity.",
              textScaleFactor: 1,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Thank you for joining our community, and we look forward to seeing you connect and thrive on our LGBTQ Social Media app!",
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.titleLarge,
            ),
          ],
        ),
      ),
    );
  }
}

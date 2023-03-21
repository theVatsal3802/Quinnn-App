import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/screens/about/about_the_app_screen.dart';
import 'package:lgbtq_social_media/screens/about/about_the_team_screen.dart';
import 'package:lgbtq_social_media/widgets/custom_drawer.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';

class AboutScreen extends StatelessWidget {
  static const routeName = "/about";
  const AboutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const CustomDrawer(),
      appBar: AppBar(
        title: const Text(
          "About Us",
          textScaleFactor: 1,
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text(
              "About ${AssetManager.appName}",
              textScaleFactor: 1,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(AboutTheAppScreen.routeName);
            },
          ),
          const Divider(),
          ListTile(
            title: const Text(
              "About the team",
              textScaleFactor: 1,
            ),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              Navigator.of(context).pushNamed(AboutTheTeamScreen.routeName);
            },
          ),
          const Divider(),
        ],
      ),
    );
  }
}

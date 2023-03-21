import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/screens/about/about_screen.dart';
import 'package:lgbtq_social_media/screens/auth/auth_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/screens/events/event_screen.dart';
import 'package:lgbtq_social_media/screens/settings/settings_screen.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: ColorManager.baseWhiteColor,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(30),
            child: Text(
              AssetManager.appName,
              textScaleFactor: 1,
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: ColorManager.baseBlueColor,
                  ),
            ),
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.home_filled,
            title: "Home",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(HomeScreen.routeName);
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.calendar_month,
            title: "Upcoming Events",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(EventScreen.routeName);
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.settings,
            title: "Settings",
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(SettingsScreen.routeName);
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.group,
            title: "About Us",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(AboutScreen.routeName);
            },
          ),
          const Divider(),
          const Spacer(),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.logout,
            title: "Logout",
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                AuthScreen.routeName,
                (route) => false,
              );
            },
          ),
        ],
      ),
    );
  }
}

Widget buildListTile({
  required BuildContext context,
  required IconData iconData,
  required String title,
  required VoidCallback onTap,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 14,
      vertical: 0,
    ),
    child: ListTile(
      style: ListTileStyle.drawer,
      leading: Icon(
        iconData,
      ),
      onTap: onTap,
      title: Text(
        title,
        textScaleFactor: 1,
        style: Theme.of(context).textTheme.titleLarge!,
      ),
    ),
  );
}

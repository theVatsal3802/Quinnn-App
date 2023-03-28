import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/screens/about/about_screen.dart';
import 'package:lgbtq_social_media/screens/auth/login_screen.dart';
import 'package:lgbtq_social_media/screens/auth/profile_setup_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/screens/events/event_screen.dart';
import 'package:lgbtq_social_media/screens/resources/resources_screen.dart';
import 'package:lgbtq_social_media/screens/tnc/terms_and_conditions.dart';
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(
                AssetManager.appLogo,
                height: 100,
                width: 100,
                fit: BoxFit.contain,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 30,
                ),
                child: Text(
                  AssetManager.appName,
                  textScaleFactor: 1,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        color: ColorManager.baseBlueColor,
                      ),
                ),
              ),
            ],
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
            title: "Events",
            onTap: () {
              Navigator.of(context).pushReplacementNamed(EventScreen.routeName);
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.description,
            title: "Resources",
            onTap: () {
              Navigator.of(context)
                  .pushReplacementNamed(ResourcesScreen.routeName);
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.settings,
            title: "Settings",
            onTap: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(
                  builder: (context) {
                    return const ProfileSetupScreen(
                      isUpdate: true,
                    );
                  },
                ),
              );
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
            iconData: Icons.rule,
            title: "Terms and Conditions",
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil(
                TermsAndConditionsScrren.routeName,
                (route) => false,
                arguments: true,
              );
            },
          ),
          const Divider(),
          buildListTile(
            context: context,
            iconData: Icons.logout,
            title: "Logout",
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                MaterialPageRoute(
                  builder: (context) {
                    return const LoginScreen(isFromSignup: false);
                  },
                ),
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

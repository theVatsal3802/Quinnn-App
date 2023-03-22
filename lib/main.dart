import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgbtq_social_media/screens/about/about_screen.dart';
import 'package:lgbtq_social_media/screens/about/about_the_app_screen.dart';
import 'package:lgbtq_social_media/screens/about/about_the_team_screen.dart';
import 'package:lgbtq_social_media/screens/auth/auth_screen.dart';
import 'package:lgbtq_social_media/screens/auth/email_confirm_screen.dart';
import 'package:lgbtq_social_media/screens/auth/forgot_password_screen.dart';
import 'package:lgbtq_social_media/screens/auth/profile_setup_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/screens/events/event_description_screen.dart';
import 'package:lgbtq_social_media/screens/events/event_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/post_screen.dart';
import 'package:lgbtq_social_media/screens/new_post/new_post_screen.dart';
import 'package:lgbtq_social_media/screens/settings/settings_screen.dart';
import 'package:lgbtq_social_media/screens/splash/splash_screen.dart';
import 'package:lgbtq_social_media/screens/tnc/terms_and_conditions.dart';
import 'package:lgbtq_social_media/utils/theme_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ],
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LGBTQ Social Media',
      theme: ThemeManager.theme(),
      home: const HomeScreen(),
      routes: {
        AboutScreen.routeName: (context) => const AboutScreen(),
        AuthScreen.routeName: (context) => const AuthScreen(),
        EmailVerificationScreen.routeName: (context) =>
            const EmailVerificationScreen(),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        ProfileSetupScreen.routeName: (context) => const ProfileSetupScreen(),
        HomeScreen.routeName: (context) => const HomeScreen(),
        EventScreen.routeName: (context) => const EventScreen(),
        SettingsScreen.routeName: (context) => const SettingsScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        PostScreen.routeName: (context) => const PostScreen(),
        EventDescriptionScreen.routeName: (context) =>
            const EventDescriptionScreen(),
        NewPostScreen.routeName: (context) => const NewPostScreen(),
        AboutTheAppScreen.routeName: (context) => const AboutTheAppScreen(),
        AboutTheTeamScreen.routeName: (context) => const AboutTheTeamScreen(),
        TermsAndConditionsScrren.routeName: (context) =>
            const TermsAndConditionsScrren(),
      },
    );
  }
}

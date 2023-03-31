import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:lgbtq_social_media/screens/about/about_screen.dart';
import 'package:lgbtq_social_media/screens/about/about_the_app_screen.dart';
import 'package:lgbtq_social_media/screens/about/about_the_team_screen.dart';
import 'package:lgbtq_social_media/screens/auth/login_screen.dart';
import 'package:lgbtq_social_media/screens/auth/signup_screen.dart';
import 'package:lgbtq_social_media/screens/auth/forgot_password_screen.dart';
import 'package:lgbtq_social_media/screens/auth/profile_setup_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/home_screen.dart';
import 'package:lgbtq_social_media/screens/events/add_event_screen.dart';
import 'package:lgbtq_social_media/screens/events/event_screen.dart';
import 'package:lgbtq_social_media/screens/dashboard/post_screen.dart';
import 'package:lgbtq_social_media/screens/new_post/new_post_screen.dart';
import 'package:lgbtq_social_media/screens/profile/profile_screen.dart';
import 'package:lgbtq_social_media/screens/resources/resource_description_screen.dart';
import 'package:lgbtq_social_media/screens/resources/resources_screen.dart';
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
      debugShowCheckedModeBanner: false,
      routes: {
        AboutScreen.routeName: (context) => const AboutScreen(),
        SignupScreen.routeName: (context) => const SignupScreen(),
        LoginScreen.routeName: (context) => const LoginScreen(
              isFromSignup: false,
            ),
        ForgotPasswordScreen.routeName: (context) =>
            const ForgotPasswordScreen(),
        ProfileSetupScreen.routeName: (context) => const ProfileSetupScreen(
              isUpdate: false,
            ),
        HomeScreen.routeName: (context) => const HomeScreen(),
        EventScreen.routeName: (context) => const EventScreen(),
        SplashScreen.routeName: (context) => const SplashScreen(),
        PostScreen.routeName: (context) => const PostScreen(),
        NewPostScreen.routeName: (context) => const NewPostScreen(),
        AboutTheAppScreen.routeName: (context) => const AboutTheAppScreen(),
        AboutTheTeamScreen.routeName: (context) => const AboutTheTeamScreen(),
        TermsAndConditionsScrren.routeName: (context) =>
            const TermsAndConditionsScrren(),
        ProfileScreen.routeName: (context) => const ProfileScreen(),
        ResourcesScreen.routeName: (context) => const ResourcesScreen(),
        ResourceDescriptionScreen.routeName: (context) =>
            const ResourceDescriptionScreen(),
        AddEventScreen.routeName: (context) => const AddEventScreen(),
      },
    );
  }
}

import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/assets_manager.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class SplashScreen extends StatelessWidget {
  static const routeName = "/splash";
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.baseBlueColor,
      body: Center(
        child: Image.asset(
          AssetManager.appLogo,
          height: MediaQuery.of(context).size.width * 0.6,
          width: MediaQuery.of(context).size.width * 0.6,
        ),
      ),
    );
  }
}

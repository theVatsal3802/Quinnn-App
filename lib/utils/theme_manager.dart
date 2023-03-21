import 'package:flutter/material.dart';
import 'package:lgbtq_social_media/utils/color_manager.dart';

class ThemeManager {
  static ThemeData theme() {
    return ThemeData(
      primaryColor: ColorManager.baseBlueColor,
      splashColor: ColorManager.baseGreyColor,
      colorScheme: ColorScheme(
        brightness: Brightness.light,
        primary: ColorManager.baseBlueColor,
        onPrimary: ColorManager.baseWhiteShadeColor,
        secondary: ColorManager.baseBlackColor,
        onSecondary: ColorManager.baseDarkGreyColor,
        error: Colors.red.shade800,
        onError: ColorManager.baseWhiteColor,
        background: ColorManager.baseWhiteShadeColor,
        onBackground: ColorManager.baseBlackColor,
        surface: ColorManager.baseWhiteColor,
        onSurface: ColorManager.baseBlackColor,
      ),
      scaffoldBackgroundColor: ColorManager.baseWhiteShadeColor,
      appBarTheme: const AppBarTheme(
        backgroundColor: ColorManager.baseWhiteColor,
        centerTitle: false,
        elevation: 1,
        foregroundColor: ColorManager.baseBlueColor,
      ),
      inputDecorationTheme: InputDecorationTheme(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: const BorderSide(
            color: ColorManager.baseBlackColor,
            width: 2,
          ),
        ),
      ),
    );
  }
}

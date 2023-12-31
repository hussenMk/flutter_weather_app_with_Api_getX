import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/core/constant/colors.dart';
import 'package:flutter_weather_app_with_getx/core/services/services.dart';
import 'package:get/get.dart';

class ThemeService {
  static ThemeData ligtTheme = ThemeData(
    brightness: Brightness.light,
    fontFamily: "Cairo",
    cardColor: AppColors.lightGrey,
    colorScheme: ColorScheme.light(
      primary: AppColors.lightGrey,
      secondary: AppColors.blue,
      tertiary: const Color(0xffE9ECF1),
      onPrimary: AppColors.blue.withOpacity(0.8),
      onSecondary: AppColors.spaceGrey.withOpacity(.6),
      onBackground: AppColors.lightGrey,
      onTertiary: AppColors.white,
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
      backgroundColor: AppColors.spaceGrey,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    fontFamily: "Cairo",
    colorScheme: ColorScheme.dark(
      background: const Color(0xff303030),
      primary: const Color(0xff424242).withOpacity(.9),
      secondary: const Color(0xffE9ECF1),
      tertiary: const Color.fromARGB(255, 56, 56, 56),
      onPrimary: const Color.fromARGB(255, 151, 151, 151).withOpacity(.9),
      onSecondary: AppColors.lightGrey3,
      onBackground: const Color.fromARGB(255, 81, 81, 81),
      onTertiary: const Color.fromARGB(184, 87, 87, 87),
    ),
    floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: AppColors.lightGrey),
  );

  MyServices myServices = Get.find();
  final darkThemeKey = "isDarkTheme";

  void saveThemeData(bool isDarkMode) {
    myServices.sharedPreferences.setBool(darkThemeKey, isDarkMode);
  }

  bool isSaveDarkMode() {
    return myServices.sharedPreferences.getBool(darkThemeKey) ?? false;
  }

  ThemeMode getThemeMode() {
    return isSaveDarkMode() ? ThemeMode.dark : ThemeMode.light;
  }

  void changeThemeMode() {
    Get.changeThemeMode(isSaveDarkMode() ? ThemeMode.light : ThemeMode.dark);
    saveThemeData(!isSaveDarkMode());
  }
}

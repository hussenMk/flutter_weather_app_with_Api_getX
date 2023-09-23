import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/binding/initial_binding.dart';
import 'package:flutter_weather_app_with_getx/core/class/theme_data.dart';
import 'package:flutter_weather_app_with_getx/core/services/services.dart';
import 'package:flutter_weather_app_with_getx/routes.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initialServices();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialBinding: initialBinding(),
      theme: ThemeService.ligtTheme,
      darkTheme: ThemeService.darkTheme,
      themeMode: ThemeService().getThemeMode(),
      getPages: routes,
    );
  }
}

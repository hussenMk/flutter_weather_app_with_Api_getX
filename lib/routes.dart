import 'package:flutter_weather_app_with_getx/screen/view/home_screen_view.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

List<GetPage<dynamic>>? routes = [
  GetPage(name: "/", page: () => const HomeScreen())
];

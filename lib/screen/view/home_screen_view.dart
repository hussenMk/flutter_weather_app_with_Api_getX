import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/controller/home_screen_controller.dart';
import 'package:flutter_weather_app_with_getx/core/class/handling_data_view.dart';
import 'package:flutter_weather_app_with_getx/screen/widget/custom_card_data_weather.dart';
import 'package:flutter_weather_app_with_getx/screen/widget/custom_list_tile.dart';
import 'package:flutter_weather_app_with_getx/screen/widget/custom_title.dart';
import 'package:flutter_weather_app_with_getx/screen/widget/daily_data_forecast.dart';
import 'package:flutter_weather_app_with_getx/screen/widget/hourly_data.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenController());
    return Scaffold(
      body: GetBuilder<HomeScreenController>(
        builder: (controller) => HandlingDataView(
          statusRequest: controller.statusRequest,
          widget: Container(
            padding: const EdgeInsets.all(10),
            child: ListView(
              children: [
                CustomListTile(),
                const SizedBox(height: 10),
                CustomCardDataWeather(),
                const SizedBox(height: 20),
                CustomTitle(title: 'Today'),
                HourlyData(),
                const SizedBox(height: 10),
                CustomTitle(title: 'Forcast Next 5 Days'),
                const SizedBox(height: 10),
                DailyDataForecast()
              ],
            ),
          ),
        ),
      ),
    );
  }
}

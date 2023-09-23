import 'package:flutter/widgets.dart';
import 'package:flutter_weather_app_with_getx/core/class/status_request.dart';
import 'package:flutter_weather_app_with_getx/core/constant/app_links.dart';
import 'package:flutter_weather_app_with_getx/core/functions/handling_data.dart';
import 'package:flutter_weather_app_with_getx/data/data_source/home_screen_data.dart';
import 'package:get/get.dart';

class HomeScreenController extends GetxController {
  HomeScreenData homeScreenData = HomeScreenData(Get.find());

  List forecastData = [];
  List weatherData = [];
  int? selected;

  TextEditingController city = TextEditingController();

  late StatusRequest statusRequest;

  changeIndex(int val) {
    selected = val;
    update();
  }

  String urlForecastData(String city) {
    String url =
        '${AppLinks.baseUrl}/forecast?q=$city&appid=${AppLinks.apiKey}';
    return url;
  }

  String urlWeatherData(String city) {
    String url = '${AppLinks.baseUrl}/weather?q=$city&appid=${AppLinks.apiKey}';
    return url;
  }

  getForecastData() async {
    statusRequest = StatusRequest.loading;
    var response = await homeScreenData.getWeatherData(
      urlForecastData(city.text.isEmpty ? city.text = "Medina" : city.text),
    );
    print("=============================== Response $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      forecastData.clear();
      forecastData.addAll(response['list']);
    }
    update();
  }

  getWeatherData() async {
    update();
    statusRequest = StatusRequest.loading;
    var response = await homeScreenData.getForecastData(
      urlWeatherData(city.text.isEmpty ? city.text = "Medina" : city.text),
    );
    print("=============================== Response $response ");
    statusRequest = handlingData(response);
    if (StatusRequest.success == statusRequest) {
      weatherData.clear();
      weatherData.add(response);
    }
    update();
  }

  @override
  void onInit() {
    getForecastData();
    getWeatherData();
    super.onInit();
  }
}

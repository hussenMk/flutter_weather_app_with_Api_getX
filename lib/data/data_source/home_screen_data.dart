import 'package:flutter_weather_app_with_getx/core/class/crud.dart';

class HomeScreenData {
  Crud crud;

  HomeScreenData(this.crud);

  getWeatherData(String url) async {
    var response = await crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }

  getForecastData(String url) async {
    var response = await crud.getData(url);
    return response.fold((l) => l, (r) => r);
  }
}

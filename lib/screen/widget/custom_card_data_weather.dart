import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/controller/home_screen_controller.dart';
import 'package:get/get.dart';

class CustomCardDataWeather extends GetView<HomeScreenController> {
  const CustomCardDataWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: controller.weatherData.length,
      itemBuilder: (context, index) {
        return Items(index: index);
      },
    );
  }
}

class Items extends GetView<HomeScreenController> {
  const Items({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        children: [
          TextFormField(
            controller: controller.city,
            keyboardType: TextInputType.text,
            decoration: InputDecoration(
              hintText: "Search",
              filled: true,
              contentPadding: const EdgeInsets.all(10),
              suffixIcon: Container(
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 102, 174, 229),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: IconButton(
                  onPressed: () {
                    controller.getWeatherData();

                    controller.getForecastData();

                    controller.city.text = "";
                  },
                  icon: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "${controller.forecastData[index]['weather'][0]['description']}",
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                  Image.asset(
                    "assets/images/${controller.forecastData[index]['weather'][0]['icon']}.png",
                    height: 80,
                  ),
                ],
              ),
              Text(
                '${(controller.forecastData[index]['main']['temp'] - 273.15).round().toString()}\u2103',
                style: const TextStyle(
                  fontSize: 60,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          const Divider(
            indent: 10,
            endIndent: 10,
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/images/windspeed.png"),
              ),
              Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.tertiary,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Image.asset("assets/images/clouds.png"),
              ),
              Container(
                height: 55,
                width: 55,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.tertiary,
                    borderRadius: BorderRadius.circular(15)),
                child: Image.asset("assets/images/humidity.png"),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  '${controller.forecastData[index]['wind']['speed']} km/h',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  '${controller.forecastData[index]['clouds']['all']}%',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(
                height: 20,
                width: 60,
                child: Text(
                  '${controller.forecastData[index]['main']['humidity']}%',
                  style: const TextStyle(fontSize: 12),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}

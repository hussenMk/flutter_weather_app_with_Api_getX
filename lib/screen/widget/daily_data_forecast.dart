import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class DailyDataForecast extends StatelessWidget {
  DailyDataForecast({super.key});

  @override
  Widget build(BuildContext context) {
    List possition = [0, 8, 16, 24, 32];

    return Card(
      shape: ContinuousRectangleBorder(borderRadius: BorderRadius.circular(15)),
      color: Theme.of(context).colorScheme.primary,
      child: ListView.separated(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: possition.length,
        itemBuilder: (context, index) {
          return Items(
            index: possition[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) => const Divider(),
      ),
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
    return SizedBox(
      height: 50,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 80,
                child: Text(
                  Jiffy.parse("${controller.forecastData[index]['dt_txt']}")
                      .EEEE,
                  style: const TextStyle(fontSize: 13),
                ),
              ),
              SizedBox(
                height: 30,
                width: 30,
                child: Image.asset(
                  "assets/images/${controller.forecastData[index]['weather'][0]['icon']}.png",
                  height: 40,
                  width: 40,
                ),
              ),
              Text(
                '${(controller.forecastData[index]['main']['temp_min'] - 273.15).round().toString()}\u2103 / ${(controller.forecastData[index]['main']['temp_max'] - 273.15).round().toString()}\u2103',
                style: const TextStyle(fontSize: 13),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

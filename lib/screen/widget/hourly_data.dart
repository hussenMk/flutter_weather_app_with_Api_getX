import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/controller/home_screen_controller.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class HourlyData extends StatelessWidget {
  HourlyData({super.key});

  @override
  Widget build(BuildContext context) {
    List possition = [0, 1, 2, 3, 4];
    return Container(
      height: 160,
      padding: const EdgeInsets.only(top: 10, bottom: 10),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: possition.length,
        itemBuilder: (context, index) {
          return Items(
            index: possition[index],
          );
        },
        separatorBuilder: (BuildContext context, int index) =>
            const SizedBox(width: 5),
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
    return InkWell(
      onTap: () {
        controller.changeIndex(index);
      },
      child: Container(
        width: 90,
        margin: const EdgeInsets.only(right: 5),
        decoration: controller.selected == index
            ? BoxDecoration(
                color: const Color.fromARGB(255, 102, 174, 229),
                borderRadius: BorderRadius.circular(12),
              )
            : BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(12),
              ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Container(
              margin: const EdgeInsets.only(top: 10),
              child: Text(
                Jiffy.parse("${controller.forecastData[index]['dt_txt']}").jm,
                style: const TextStyle(fontSize: 13),
              ),
            ),
            Container(
                margin: const EdgeInsets.all(5),
                child: Image.asset(
                  "assets/images/${controller.forecastData[index]['weather'][0]['icon']}.png",
                  height: 40,
                  width: 40,
                )),
            Container(
              margin: const EdgeInsets.only(bottom: 10),
              child: Text(
                '${(controller.forecastData[index]['main']['temp'] - 273.15).round().toString()}\u2103',
              ),
            )
          ],
        ),
      ),
    );
  }
}

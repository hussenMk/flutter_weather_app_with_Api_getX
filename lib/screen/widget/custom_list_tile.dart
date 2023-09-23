import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_weather_app_with_getx/controller/home_screen_controller.dart';
import 'package:flutter_weather_app_with_getx/core/class/theme_data.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CustomListTile extends GetView<HomeScreenController> {
  const CustomListTile({
    super.key,
  });

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

class Items extends GetWidget<HomeScreenController> {
  const Items({
    super.key,
    required this.index,
  });

  final int index;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        '${controller.weatherData[index]['name']}',
        style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
        maxLines: 1,
      ),
      subtitle: Text(
        DateFormat().add_yMMMEd().format(DateTime.now()),
        style: const TextStyle(
          fontSize: 16,
        ),
      ),
      trailing: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary,
          borderRadius: BorderRadius.circular(10),
        ),
        child: IconButton(
          onPressed: () => ThemeService().changeThemeMode(),
          icon: Icon(
            CupertinoIcons.moon_fill,
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),
      ),
    );
  }
}

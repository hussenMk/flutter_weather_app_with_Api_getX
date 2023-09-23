import 'package:flutter_weather_app_with_getx/core/class/crud.dart';
import 'package:get/instance_manager.dart';

class initialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(Crud());
  }
}

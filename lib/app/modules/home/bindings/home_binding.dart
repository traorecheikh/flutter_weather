// lib/modules/home/home_binding.dart
import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:weatherinx/app/modules/weather/controllers/weather_controller.dart';

import '../../../core/constants/api_constants.dart';
import '../../../data/repositories/weather_repositories.dart';
import '../../../data/services/api_client.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(WeatherRepository(WeatherApiClient())),
    );
  }
}

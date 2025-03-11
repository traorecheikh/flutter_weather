import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'app/core/constants/api_constants.dart';
import 'app/core/themes/theme_controller.dart';
import 'app/data/repositories/weather_repositories.dart';
import 'app/data/services/api_client.dart';
import 'app/modules/home/views/home_view.dart';
import 'app/routes/app_pages.dart';

void main() {
  Get.put<ThemeController>(ThemeController());
  runApp(WeatherInx());
}

class WeatherInx extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ThemeController themeController = Get.find();
    return Obx(
      () => GetMaterialApp(
        initialRoute: AppPages.INITIAL,
        getPages: AppPages.routes,
        title: 'Weather App',
        theme: themeController.currentTheme,
        home: HomeView(), // Your home view
      ),
    );
  }
}

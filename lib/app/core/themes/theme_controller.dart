import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'dark_theme.dart';
import 'light_theme.dart';

class ThemeController extends GetxController {
  RxBool isDarkMode = false.obs;

  ThemeData get currentTheme => isDarkMode.value ? darkTheme : lightTheme;

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeTheme(currentTheme);
  }
}

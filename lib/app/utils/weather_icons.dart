import 'package:flutter/material.dart';

IconData getWeatherIcon(int condition) {
  if (condition < 300) return Icons.thunderstorm;
  if (condition < 500) return Icons.grain;
  if (condition < 600) return Icons.beach_access;
  if (condition < 700) return Icons.ac_unit;
  if (condition < 800) return Icons.filter_drama;
  if (condition == 800) return Icons.wb_sunny;
  if (condition <= 804) return Icons.cloud;
  return Icons.error;
}

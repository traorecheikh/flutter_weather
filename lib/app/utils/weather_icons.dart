import 'package:flutter/material.dart';

IconData getWeatherIcon(int condition) {
  if (condition < 300) return Icons.thunderstorm;
  if (condition < 500) return Icons.grain; // drizzle
  if (condition < 600) return Icons.beach_access; // rain
  if (condition < 700) return Icons.ac_unit; // snow
  if (condition < 800) return Icons.filter_drama; // atmosphere
  if (condition == 800) return Icons.wb_sunny;
  if (condition <= 804) return Icons.cloud;
  return Icons.error;
}

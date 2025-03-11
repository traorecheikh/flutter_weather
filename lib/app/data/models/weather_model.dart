// lib/data/models/weather_model.dart
import 'package:weatherapi/weatherapi.dart';

class WeatherModel {
  final double temperature;
  final String description;
  final String cityName;
  final double wind;

  WeatherModel({
    required this.temperature,
    required this.description,
    required this.cityName,
    required this.wind,
  });

  // Factory constructor for Real-time weather
  factory WeatherModel.fromRealtimeWeather(RealtimeWeather realtimeWeather) {
    return WeatherModel(
      temperature:
          realtimeWeather.current.tempC ??
          0.0, // Safe default value for temperature
      description:
          realtimeWeather.current.condition.text ??
          "No data", // Default message for missing description
      cityName: realtimeWeather.location.name ?? "No data",
      wind: realtimeWeather.current.windKph ?? 0, // Default city name
    );
  }

  factory WeatherModel.fromForecastWeather(ForecastWeather forecastWeather) {
    // Check if forecastday is not empty or null
    if (forecastWeather.forecast.isEmpty) {
      return WeatherModel(
        wind: 0,
        temperature: 0.0, // Safe default value when there's no forecast data
        description:
            "No forecast data", // Default message when no forecast is available
        cityName:
            forecastWeather.location.name ?? "No data", // Default city name
      );
    }

    final forecastDay = forecastWeather.forecast[0];
    return WeatherModel(
      wind: forecastDay.day.avgvisKm ?? 0,
      temperature: forecastDay.day.avgtempC ?? 0.0,
      description: forecastDay.day.condition.text ?? "No data",
      cityName: forecastWeather.location.name ?? "No data",
    );
  }
}

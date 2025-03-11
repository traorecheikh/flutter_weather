import 'package:weatherinx/app/data/models/weather_model.dart';
import 'package:weatherinx/app/data/services/api_client.dart';
import 'package:weatherinx/app/data/services/exceptions.dart';

class WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  WeatherRepository(this._weatherApiClient);

  Future<WeatherModel> fetchCurrentWeatherByCity(String cityName) async {
    try {
      final realtimeWeather = await _weatherApiClient.getRealtimeWeatherByCity(
        cityName,
      );
      return WeatherModel.fromRealtimeWeather(realtimeWeather);
    } on WeatherApiException catch (e) {
      throw WeatherApiException('Error fetching current weather: ${e.message}');
    }
  }

  Future<WeatherModel> fetchForecastWeatherByCity(String cityName) async {
    try {
      final forecastWeather = await _weatherApiClient.getForecastWeatherByCity(
        cityName,
      );
      return WeatherModel.fromForecastWeather(forecastWeather);
    } on WeatherApiException catch (e) {
      throw WeatherApiException(
        'Error fetching forecast weather: ${e.message}',
      );
    }
  }
}

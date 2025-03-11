// lib/core/services/weather_api_client.dart
import 'package:weatherapi/weatherapi.dart';
import 'package:weatherinx/app/core/constants/api_constants.dart';
import 'package:weatherinx/app/data/services/exceptions.dart';

class WeatherApiClient {
  final WeatherRequest _weatherRequest;

  WeatherApiClient()
    : _weatherRequest = WeatherRequest(ApiConstants.apiKey,language: Language.french);

  Future<RealtimeWeather> getRealtimeWeatherByCity(String cityName) async {
    try {
      return await _weatherRequest.getRealtimeWeatherByCityName(cityName);
    } catch (error) {
      throw WeatherApiException('Failed to fetch realtime weather: $error');
    }
  }

  Future<RealtimeWeather> getRealtimeWeatherByLocation(
    double latitude,
    double longitude,
  ) async {
    try {
      return await _weatherRequest.getRealtimeWeatherByLocation(
        latitude,
        longitude,
      );
    } catch (error) {
      throw WeatherApiException('Failed to fetch realtime weather: $error');
    }
  }

  Future<ForecastWeather> getForecastWeatherByCity(String cityName) async {
    try {
      return await _weatherRequest.getForecastWeatherByCityName(cityName);
    } catch (error) {
      throw WeatherApiException('Failed to fetch forecast weather: $error');
    }
  }

  Future<ForecastWeather> getForecastWeatherByLocation(
    double latitude,
    double longitude,
  ) async {
    try {
      return await _weatherRequest.getForecastWeatherByLocation(
        latitude,
        longitude,
      );
    } catch (error) {
      throw WeatherApiException('Failed to fetch forecast weather: $error');
    }
  }

  Future<SearchResults> searchLocationsByCity(String cityName) async {
    try {
      return await _weatherRequest.getResultsByCityName(cityName);
    } catch (error) {
      throw WeatherApiException('Failed to search locations: $error');
    }
  }

  Future<SearchResults> searchLocationsByCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      return await _weatherRequest.getResultsByLocation(latitude, longitude);
    } catch (error) {
      throw WeatherApiException('Failed to search locations: $error');
    }
  }
}

import 'package:weatherinx/app/data/models/weather_model.dart';
import 'package:weatherinx/app/data/services/api_client.dart';
import 'package:weatherinx/app/data/services/exceptions.dart';

class WeatherRepository {
  final WeatherApiClient _weatherApiClient;

  // Constructeur qui initialise l'objet WeatherApiClient
  WeatherRepository(this._weatherApiClient);

  // Methode pour recuperer les donnees de la meteo actuelle d'une ville
  // Elle utilise l'API pour obtenir les donnees et les convertit en WeatherModel
  Future<WeatherModel> fetchCurrentWeatherByCity(String cityName) async {
    try {
      // Appel de l'API pour obtenir la meteo en temps reel
      final realtimeWeather = await _weatherApiClient.getRealtimeWeatherByCity(
        cityName,
      );
      // Conversion des donnees en WeatherModel
      return WeatherModel.fromRealtimeWeather(realtimeWeather);
    } on WeatherApiException catch (e) {
      // En cas d'erreur, on lance une nouvelle exception avec un message d'erreur
      throw WeatherApiException(
        'Erreur lors de la recuperation de la meteo actuelle: ${e.message}',
      );
    }
  }

  // Methode pour recuperer les previsions meteo d'une ville
  // Elle utilise l'API pour obtenir les previsions et les convertit en WeatherModel
  Future<WeatherModel> fetchForecastWeatherByCity(String cityName) async {
    try {
      // Appel de l'API pour obtenir les previsions meteo
      final forecastWeather = await _weatherApiClient.getForecastWeatherByCity(
        cityName,
      );
      // Conversion des donnees en WeatherModel
      return WeatherModel.fromForecastWeather(forecastWeather);
    } on WeatherApiException catch (e) {
      // En cas d'erreur, on lance une nouvelle exception avec un message d'erreur
      throw WeatherApiException(
        'Erreur lors de la recuperation des previsions meteo: ${e.message}',
      );
    }
  }
}

import 'package:weatherapi/weatherapi.dart';
import 'package:weatherinx/app/core/constants/api_constants.dart';
import 'package:weatherinx/app/data/services/exceptions.dart';

class WeatherApiClient {
  final WeatherRequest _weatherRequest;

  // Constructeur qui initialise l'objet WeatherRequest avec la cle API et la langue
  WeatherApiClient()
    : _weatherRequest = WeatherRequest(
        ApiConstants.apiKey,
        language: Language.french,
      );

  // Methode pour obtenir la meteo en temps reel d'une ville
  Future<RealtimeWeather> getRealtimeWeatherByCity(String cityName) async {
    try {
      // Appel de l'API pour obtenir la meteo en temps reel d'une ville
      return await _weatherRequest.getRealtimeWeatherByCityName(cityName);
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recuperation de la meteo en temps reel: $error',
      );
    }
  }

  // Methode pour obtenir la meteo en temps reel par localisation (latitude et longitude)
  Future<RealtimeWeather> getRealtimeWeatherByLocation(
    double latitude,
    double longitude,
  ) async {
    try {
      // Appel de l'API pour obtenir la meteo en temps reel par localisation
      return await _weatherRequest.getRealtimeWeatherByLocation(
        latitude,
        longitude,
      );
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recuperation de la meteo en temps reel: $error',
      );
    }
  }

  // Methode pour obtenir les previsions meteo d'une ville
  Future<ForecastWeather> getForecastWeatherByCity(String cityName) async {
    try {
      // Appel de l'API pour obtenir les previsions meteo d'une ville
      return await _weatherRequest.getForecastWeatherByCityName(cityName);
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recuperation des previsions meteo: $error',
      );
    }
  }

  // Methode pour obtenir les previsions meteo par localisation (latitude et longitude)
  Future<ForecastWeather> getForecastWeatherByLocation(
    double latitude,
    double longitude,
  ) async {
    try {
      // Appel de l'API pour obtenir les previsions meteo par localisation
      return await _weatherRequest.getForecastWeatherByLocation(
        latitude,
        longitude,
      );
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recuperation des previsions meteo: $error',
      );
    }
  }

  // Methode pour rechercher des localisations par nom de ville
  Future<SearchResults> searchLocationsByCity(String cityName) async {
    try {
      // Appel de l'API pour rechercher des localisations par nom de ville
      return await _weatherRequest.getResultsByCityName(cityName);
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recherche des localisations: $error',
      );
    }
  }

  // Methode pour rechercher des localisations par coordonnees (latitude et longitude)
  Future<SearchResults> searchLocationsByCoordinates(
    double latitude,
    double longitude,
  ) async {
    try {
      // Appel de l'API pour rechercher des localisations par coordonnees
      return await _weatherRequest.getResultsByLocation(latitude, longitude);
    } catch (error) {
      // En cas d'erreur, on lance une exception avec le message d'erreur
      throw WeatherApiException(
        'Echec de la recherche des localisations: $error',
      );
    }
  }
}

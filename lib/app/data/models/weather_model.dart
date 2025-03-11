import 'package:weatherapi/weatherapi.dart';

// Classe representant un modele de donnees meteo
// Elle contient des informations comme la temperature, la description, la vitesse du vent, l'humidite, etc.
class WeatherModel {
  final double? temperature; // Temperature actuelle en degres Celsius
  final String?
  description; // Description de l'etat du temps (ex: "Ensoleille")
  final String? cityName; // Nom de la ville
  final double? windSpeed; // Vitesse du vent en kilometres par heure
  final int? humidity; // Humidite en pourcentage
  final double? feelsLike; // Temperature ressenti en degres Celsius
  final double? pressure; // Pression atmospherique en hPa (hectopascals)
  final String?
  iconUrl; // URL de l'icone representant l'etat du temps (ex: un soleil, un nuage)

  // Constructeur de la classe WeatherModel, utilise pour initialiser toutes les proprietes
  WeatherModel({
    required this.temperature,
    required this.description,
    required this.cityName,
    required this.windSpeed,
    required this.humidity,
    required this.feelsLike,
    required this.iconUrl,
    required this.pressure,
  });

  // Factory qui cree un objet WeatherModel a partir des donnees meteo en temps reel
  // Le parametre realtimeWeather est de type RealtimeWeather (donnees meteo en temps reel)
  factory WeatherModel.fromRealtimeWeather(RealtimeWeather realtimeWeather) {
    return WeatherModel(
      // Les donnees meteo en temps reel sont extraites pour initialiser chaque propriete du modele
      temperature:
          realtimeWeather.current.tempC, // Temperature en degres Celsius
      description:
          realtimeWeather
              .current
              .condition
              .text, // Description de la meteo actuelle
      cityName: realtimeWeather.location.name, // Nom de la ville
      windSpeed: realtimeWeather.current.windKph, // Vitesse du vent en km/h
      humidity: realtimeWeather.current.humidity, // Humidite en %
      feelsLike:
          realtimeWeather.current.feelslikeC, // Temperature ressenti en °C
      pressure:
          realtimeWeather.current.pressureMb, // Pression atmospherique en hPa
      iconUrl:
          realtimeWeather
              .current
              .condition
              .icon, // URL de l'icone de l'etat du temps
    );
  }

  // Factory qui cree un objet WeatherModel a partir des donnees de prevision meteo
  // Le parametre forecastWeather contient les previsions meteorologiques
  factory WeatherModel.fromForecastWeather(ForecastWeather forecastWeather) {
    // Si aucune prevision n'est disponible, on retourne un modele avec des valeurs par defaut
    if (forecastWeather.forecast.isEmpty) {
      return WeatherModel(
        windSpeed: 0, // Aucune donnees de vent
        temperature: 0.0, // Aucune donnees de temperature
        description:
            "Pas de donnees de prevision", // Message d'absence de donnees
        cityName:
            forecastWeather.location.name ??
            "Aucune donnees", // Nom de la ville ou message par defaut
        humidity: 0, // Aucune donnees d'humidite
        pressure: 0, // Aucune donnees de pression
        feelsLike: 0.0, // Aucune donnees de temperature ressenti
        iconUrl: "", // Aucune icone disponible
      );
    }

    // Si des previsions sont disponibles, on recupere les donnees de la premiere journee
    final forecastDay = forecastWeather.forecast[0];
    return WeatherModel(
      windSpeed: forecastDay.day.avgvisKm, // Vitesse du vent en km (prevision)
      temperature:
          forecastDay.day.avgtempC, // Temperature moyenne en °C pour la journee
      description:
          forecastDay
              .day
              .condition
              .text, // Description de l'etat du temps pour la journee
      cityName: forecastWeather.location.name, // Nom de la ville
      humidity: forecastDay.day.avghumidity, // Humidite moyenne pour la journee
      feelsLike:
          forecastDay
              .day
              .avgtempC, // Temperature ressenti moyenne (pour la journee)
      pressure: null, // Pas de donnees de pression dans les previsions
      iconUrl:
          forecastDay.day.condition.icon, // URL de l'icone de l'etat du temps
    );
  }
}

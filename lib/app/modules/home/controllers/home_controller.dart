// lib/modules/weather/weather_controller.dart
import 'package:get/get.dart';
import 'package:weatherinx/app/data/models/weather_model.dart';
import 'package:weatherinx/app/data/repositories/weather_repositories.dart';

class HomeController extends GetxController {
  final WeatherRepository _weatherRepository;
  var weatherModel = Rxn<WeatherModel>();

  HomeController(this._weatherRepository);

  Future<void> fetchWeatherByCity(String cityName) async {
    try {
      weatherModel.value = await _weatherRepository.fetchCurrentWeatherByCity(
        cityName,
      );
    } catch (error) {
      Get.snackbar('Error', 'Could not fetch weather data');
    }
  }
}

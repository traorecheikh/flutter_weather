import 'package:get/get.dart';
import '../../../data/repositories/weather_repositories.dart';
import '../../../data/services/api_client.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(WeatherRepository(WeatherApiClient())),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:weatherinx/app/modules/home/controllers/home_controller.dart';

class HomeView extends GetWidget<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            controller.weatherModel.value!=null?Text(controller.weatherModel.value!.temperature.toString()):Text("data")
          ],
        ),
      ),
    );
  }
}

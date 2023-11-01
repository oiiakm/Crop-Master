import 'package:cropmaster/features/weather/domain/weather_controller.dart';
import 'package:cropmaster/features/weather/presentation/widgets/weather_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class WeatherPage extends StatelessWidget {
  final WeatherController weatherController = Get.put(WeatherController());

  WeatherPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const WeatherHeaderWidget(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            SizedBox(height: 20.h),
                Card(
                  elevation: 5,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  margin: const EdgeInsets.all(20),
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      children: [
                        Obx(() {
                          if (weatherController.isLoading.value) {
                            return const CircularProgressIndicator();
                          } else {
                            return Column(
                              children: [
                                Text(
                                  weatherController.userLocationDetails.value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  weatherController.weatherData.value,
                                  style: const TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                const Divider(),
                                Text(
                                  weatherController.weatherAnalysis.value,
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            );
                          }
                        }),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

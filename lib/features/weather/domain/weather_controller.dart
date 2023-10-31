import 'package:cropmaster/features/weather/data/network_api_service.dart';
import 'package:cropmaster/features/weather/domain/user_location.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:get/get.dart';

class WeatherController extends GetxController {
  final networkApiService = NetworkApiService();
  final RxString userLocationDetails = "".obs;
  final RxString weatherData = "".obs;
  final RxBool isLoading = false.obs;
  final RxString weatherAnalysis = "".obs;

  @override
  void onInit() {
    super.onInit();
    fetchDataFromApi();
  }

  Future<void> fetchDataFromApi() async {
    isLoading.value = true;

    UserLocation userLocation = UserLocation();
    PermissionStatus status = await Permission.location.request();

    if (status.isGranted) {
      try {
        Map<String, double> locationCoordinates =
            await userLocation.getLatitudeAndLongitude();
        double latitude = locationCoordinates['latitude']!;
        double longitude = locationCoordinates['longitude']!;

        print('Latitude: $latitude, Longitude: $longitude');

        String apiKey = 'db08eecec352472d894181851233110';
        String apiUrl =
            'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=$latitude,$longitude&aqi=yes';

        dynamic responseData = await networkApiService.getAPi(apiUrl);

        updateWeatherData(responseData);
      } catch (e) {
        print('Error fetching data: $e');
      } finally {
        isLoading.value = false;
      }
    } else {
      print(
          'User denied location permissions. You may want to provide guidance on enabling them.');
      isLoading.value = false;
    }
  }

  void updateWeatherData(Map<String, dynamic> data) {
    final location = data['location'];
    final current = data['current'];

    if (location != null && current != null) {
      userLocationDetails.value =
          'Location: ${location['name']}, ${location['region']}, ${location['country']}';
      weatherData.value =
          'Temperature: ${current['temp_c']}°C, Condition: ${current['condition']['text']}';

      analyzeWeatherData(current);
    } else {
      userLocationDetails.value = 'Location data not available';
      weatherData.value = 'Weather data not available';
    }
  }

  void analyzeWeatherData(Map<String, dynamic> currentData) {
    final temperatureCelsius = currentData['temp_c'];
    final temperatureFahrenheit = currentData['temp_f'];
    final isDay = currentData['is_day'];
    final weatherCondition = currentData['condition']['text'];
    final windSpeedMph = currentData['wind_mph'];
    final windSpeedKph = currentData['wind_kph'];
    final humidity = currentData['humidity'];
    final airQualityIndexUS = currentData['air_quality']['us-epa-index'];
    final airQualityIndexGB = currentData['air_quality']['gb-defra-index'];

    String analysis = 'Weather Analysis:\n';
    analysis += 'Temperature (Celsius): $temperatureCelsius°C\n';
    analysis += 'Temperature (Fahrenheit): $temperatureFahrenheit°F\n';
    analysis += 'Is it daytime? ${isDay == 1 ? "Yes" : "No"}\n';
    analysis += 'Weather Condition: $weatherCondition\n';
    analysis += 'Wind Speed (mph): $windSpeedMph mph\n';
    analysis += 'Wind Speed (kph): $windSpeedKph kph\n';
    analysis += 'Humidity: $humidity%\n';
    analysis += 'US EPA Air Quality Index: $airQualityIndexUS\n';
    analysis += 'GB DEFRA Air Quality Index: $airQualityIndexGB\n';

    weatherAnalysis.value = analysis;
  }
}

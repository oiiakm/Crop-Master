import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';

class UserLocation {
  Future<Map<String, double>> getLatitudeAndLongitude() async {
    try {
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
        if (!serviceEnabled) {
          bool enableLocationService = await Geolocator.openLocationSettings();
          if (!enableLocationService) {
            return {'latitude': 0.0, 'longitude': 0.0};
          }
        }

        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          return {'latitude': 0.0, 'longitude': 0.0};
        }
      }

      Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      double latitude = position.latitude;
      double longitude = position.longitude;

      return {'latitude': latitude, 'longitude': longitude};
    } catch (e) {
      return {'latitude': 0.0, 'longitude': 0.0};
    }
  }

  Future<String> getUserLocationDetails() async {
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );

    List<Placemark> placemarks = await placemarkFromCoordinates(
      position.latitude,
      position.longitude,
    );

    if (placemarks.isNotEmpty) {
      Placemark placemark = placemarks[0];
      String street = placemark.street ?? "";
      String subLocality = placemark.subLocality ?? "";
      String locality = placemark.locality ?? "";
      String postalCode = placemark.postalCode ?? "";
      String country = placemark.country ?? "";

      String fullAddress =
          '$street, $subLocality, $locality, $postalCode, $country';

      return 'Address: $fullAddress';
    } else {
      return 'Location: Unknown';
    }
  }
}

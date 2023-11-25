import 'package:get/get.dart';

class MarketDialogueController extends GetxController {
  var selectedMarket = 'Select Market'.obs;
  var selectedCrop = 'Select Crop'.obs;
  var selectedDate = DateTime.now().obs;

  final List<String> marketList = [
    'Select Market',
    'Neemuch',
    'Badnagar',
    'Bhopal(F&V)'
  ];
  final List<String> cropList = ['Select Crop', 'Garlic', 'Potato', 'Onion'];

  void selectMarket(String market) {
    selectedMarket.value = market;
  }

  void selectCrop(String crop) {
    selectedCrop.value = crop;
  }

  void selectDate(DateTime date) {
    selectedDate.value = date;
  }

  void clearFields() {
    selectedMarket.value = 'Select Market';
    selectedCrop.value = 'Select Crop';
    selectedDate.value = DateTime.now();
  }
}

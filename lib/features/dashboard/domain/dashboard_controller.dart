import 'package:cropmaster/features/dashboard/data/dashboard_card_entities.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final cardDataList = <DashboardCardData>[
    DashboardCardData(
      'Profile',
    ),
    DashboardCardData(
      'Weather',
    ),
    DashboardCardData(
      'My Crops',
    ),
    DashboardCardData(
      'Market',
    ),
  ].obs;

  void handleCardTap(int index) {
    if (index == 0) {
      Get.toNamed('/profile');
    } else if (index == 1) {
      Get.toNamed('/weather');
    } else if (index == 2) {
      Get.toNamed('/mycrops');
    } else if (index == 3) {
      Get.toNamed('/market');
    }
  }
}

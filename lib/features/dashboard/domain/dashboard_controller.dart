import 'package:cropmaster/features/dashboard/data/dashboard_card_entities.dart';
import 'package:cropmaster/features/market/presentation/widgets/market_dialogue_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final cardDataList = <DashboardCardData>[
    DashboardCardData('Profile', 'assets/images/profile.jpg'),
    DashboardCardData('Weather', 'assets/images/weather.jpg'),
    DashboardCardData('My Crops', 'assets/images/crops.jpg'),
    DashboardCardData('Market', 'assets/images/market.jpg'),
  ].obs;

  void handleCardTap(int index) {
    if (index == 0) {
      Get.toNamed('/main_profile');
    } else if (index == 1) {
      Get.toNamed('/weather');
    } else if (index == 2) {
      Get.toNamed('/mycrops');
    } else if (index == 3) {
     Get.dialog(
        MarketDialogueWidget(),
        barrierDismissible: true,
        barrierColor: Colors.black.withOpacity(0.5),
      );
    }
  }
}

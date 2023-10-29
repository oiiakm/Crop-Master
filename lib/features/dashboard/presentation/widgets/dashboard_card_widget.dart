import 'package:cropmaster/features/dashboard/domain/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardCardWidget extends StatelessWidget {
  final int index;

  DashboardCardWidget({super.key, required this.index});

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    final cardData = dashboardController.cardDataList[index];

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Card(
        child: InkWell(
          onTap: () {
            dashboardController.handleCardTap(index);
          },
          child: Column(
            children: [
              Center(child: Text(cardData.title)),
             
            ],
          ),
        ),
      ),
    );
  }
}

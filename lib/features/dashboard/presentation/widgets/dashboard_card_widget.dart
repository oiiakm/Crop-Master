import 'package:cropmaster/features/dashboard/domain/dashboard_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DashboardCardWidget extends StatelessWidget {
  final int index;
  final String backgroundImageUrl;

  DashboardCardWidget(
      {super.key, required this.index, required this.backgroundImageUrl});

  final DashboardController dashboardController = Get.find();

  @override
  Widget build(BuildContext context) {
    final cardData = dashboardController.cardDataList[index];

    return Column(
      children: [
        Card(
          child: InkWell(
            onTap: () {
              dashboardController.handleCardTap(index);
            },
            child: Container(
              width: 150.w,
              height: 150.h,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(backgroundImageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Text(
              cardData.title,
              style: const TextStyle(
                  color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }
}

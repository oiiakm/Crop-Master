import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:marquee/marquee.dart';
import 'package:cropmaster/features/market/presentation/widgets/market_header_widget.dart';

class MarketPage extends StatelessWidget {
  const MarketPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    var data = Get.arguments;
    String marketName = data?['marketName'] ?? 'N/A';
    String cropName = data?['cropName'] ?? 'N/A';
    String formattedDate = data?['formattedDate'] ?? 'N/A';
    String predictionPrice = data?['predictionData'] ?? 'N/A';

    String imageAsset = '';

    if (cropName == 'Garlic') {
      imageAsset = 'assets/images/market/Garlic.jpg';
    } else if (cropName == 'Tomato') {
      imageAsset = 'assets/images/market/Tomato.jpg';
    } else if (cropName == 'Potato') {
      imageAsset = 'assets/images/market/Potato.jpg';
    }

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const MarketHeaderWidget(),
            SizedBox(
              height: 20.h,
              child: Marquee(
                text:
                    'The displayed data is a prediction and may not be entirely accurate. Please use it with caution.',
                style: const TextStyle(
                  color: Color.fromARGB(255, 222, 8, 8),
                  fontSize: 14,
                ),
                scrollAxis: Axis.horizontal,
                crossAxisAlignment: CrossAxisAlignment.start,
                blankSpace: 20.0,
                velocity: 50.0,
                startPadding: 10.0,
                accelerationDuration: const Duration(seconds: 1),
                accelerationCurve: Curves.linear,
                decelerationDuration: const Duration(milliseconds: 500),
                decelerationCurve: Curves.easeOut,
              ),
            ),
            Container(
              width: screenWidth,
              height: 210.h,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.grey[300],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  imageAsset,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Card(
                elevation: 5,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    ListTile(
                      title: const Text(
                        'Market Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        marketName,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Crop Name',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        cropName,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Date',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        formattedDate,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                    const Divider(),
                    ListTile(
                      title: const Text(
                        'Price per quintal',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        predictionPrice,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cropmaster/features/market/presentation/widgets/market_header_widget.dart';
import 'package:cropmaster/features/mycrops/presentation/widgets/mycrops_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MarketErrorPage extends StatelessWidget {
  const MarketErrorPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    double screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const MarketHeaderWidget(),
          Container(
            alignment: Alignment.center,
            height: screenHeight / 1.5,
            width: screenWidth,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.refresh,
                  color: Colors.black,
                  size: 40.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "Market is not available at the moment. Please try again later.",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color.fromARGB(255, 216, 37, 37),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}

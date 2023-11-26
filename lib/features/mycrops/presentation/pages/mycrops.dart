import 'package:cropmaster/features/mycrops/presentation/widgets/mycrops_header_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCropsPage extends StatelessWidget {
  const MyCropsPage({super.key});

  @override
  Widget build(BuildContext context) {
    double screenWidth = ScreenUtil().screenWidth;
    double screenHeight = ScreenUtil().screenHeight;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          const MyCropsHeaderWidget(),
          SizedBox(height: 30.h),
          Container(
            alignment: Alignment.center,
            height: screenHeight / 1.5,
            width: screenWidth,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.3),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.warning,
                  color: Color.fromARGB(255, 216, 37, 37),
                  size: 40.0,
                ),
                SizedBox(height: 16.0),
                Text(
                  "This is in testing mode and will be available soon!!",
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

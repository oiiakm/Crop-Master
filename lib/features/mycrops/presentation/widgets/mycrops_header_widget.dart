import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyCropsHeaderWidget extends StatelessWidget {
  const MyCropsHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    double screenWidth = ScreenUtil().screenWidth;
    double screenHeight = ScreenUtil().screenHeight;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 56, 72, 54),
      ),
    );

    return SizedBox(
      width: screenWidth,
      height: screenHeight / 7,
      child: Stack(
        children: [
          Container(
            width: screenWidth,
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 56, 72, 54),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color.fromARGB(255, 56, 72, 54),
                  blurRadius: 20,
                  offset: Offset(0, 4),
                  spreadRadius: 4,
                ),
              ],
            ),
          ),
          Positioned(
            left: 16.w,
            top: 50.h,
            child: Text(
              'My Crops',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

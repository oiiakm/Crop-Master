import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);

    double screenWidth = ScreenUtil().screenWidth;
    double screenHeight = ScreenUtil().screenHeight;

    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color.fromARGB(255, 100, 141, 177),
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
              color: Color.fromARGB(255, 100, 141, 177),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
              boxShadow: [
                BoxShadow(
                  color: Color(0x3F000000),
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
              'Dashboard',
              style: TextStyle(
                color: Colors.white,
                fontSize: 25.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Positioned(
            right: 50.w,
            top: 50.h,
            child: GestureDetector(
              onTap: () {},
              child: const Icon(
                Icons.search,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
          right: 5.w,
            top: 50.h,
            child: GestureDetector(
              onDoubleTap: () {},
              child: const Icon(
                Icons.more_vert_outlined,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

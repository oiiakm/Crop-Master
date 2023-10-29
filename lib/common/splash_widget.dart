import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashWidget extends StatelessWidget {
  final String imagePath;
  final Duration duration;
  final Function()? onFinished;

  const SplashWidget({
    super.key,
    required this.imagePath,
    required this.duration,
    this.onFinished,
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(duration, () {
      if (onFinished != null) {
        onFinished!();
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: ScreenUtil().setWidth(200),
          height: ScreenUtil().setHeight(100),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imagePath),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}

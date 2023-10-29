import 'package:cropmaster/features/auth/presentation/pages/authentication.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class InitialSplashPage extends StatefulWidget {
  const InitialSplashPage({Key? key}) : super(key: key);

  @override
  State<InitialSplashPage> createState() => _InitialSplashPageState();
}

class _InitialSplashPageState extends State<InitialSplashPage> {
  @override
  void initState() {
    super.initState();
    _startDelayedNavigation();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.white,
      ),
    );
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: ScreenUtil().setWidth(300),
          height: ScreenUtil().setHeight(200),
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/splash.gif"),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }

  void _startDelayedNavigation() {
    Future.delayed(const Duration(seconds: 2), () {
      _navigateBasedOnUserStatus();
    });
  }

  void _navigateBasedOnUserStatus() {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Get.offAllNamed('/dashboard');
    } else {
      Get.off(() => const AuthenticationPage());
    }
  }
}

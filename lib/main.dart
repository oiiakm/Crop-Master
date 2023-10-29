import 'package:cropmaster/config/routes/route_config.dart';
import 'package:cropmaster/config/routes/route_error.dart';
import 'package:cropmaster/config/routes/route_name.dart';
import 'package:cropmaster/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        ScreenUtil.init(
          context,
          designSize: const Size(428, 926),
        );
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          initialRoute: RouteName.initialSplashRouteName,
          unknownRoute: GetPage(
              name: RouteName.errorRouteName, page: () => const ErrorPage()),
          getPages: AppRoutes.pages,
        );
      },
    );
  }
}

import 'package:cropmaster/config/routes/route_config.dart';
import 'package:cropmaster/config/routes/route_error.dart';
import 'package:cropmaster/config/routes/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: RouteName.dashboardRouteName,
      unknownRoute: GetPage(
          name: RouteName.errorRouteName, page: () => const ErrorPage()),
      getPages: AppRoutes.pages,
    );
  }
}

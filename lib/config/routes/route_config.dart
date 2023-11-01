import 'package:cropmaster/config/routes/initial_splash.dart';
import 'package:cropmaster/config/routes/route_name.dart';
import 'package:cropmaster/features/auth/presentation/pages/authentication.dart';
import 'package:cropmaster/features/dashboard/presentation/pages/dashboard.dart';
import 'package:cropmaster/features/profile/presentation/pages/initial_profile_page.dart';
import 'package:cropmaster/features/profile/presentation/pages/main_profile_page.dart';
import 'package:cropmaster/features/weather/presentation/pages/weather.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(
        name: RouteName.initialSplashRouteName,
        page: () => const InitialSplashPage()),
    GetPage(name: RouteName.dashboardRouteName, page: () => DashboardPage()),
    GetPage(name: RouteName.authRouteName, page: () => AuthenticationPage()),
    GetPage(name: RouteName.initialProfileRouteName, page: () => InitialProfilePage()),
    GetPage(name: RouteName.mainProfileRouteName, page: () => MainProfilePage()),
    GetPage(name: RouteName.weatherRouteName, page: () => WeatherPage()),
  ];
}

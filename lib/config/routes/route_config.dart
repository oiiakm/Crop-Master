import 'package:cropmaster/config/routes/route_name.dart';
import 'package:cropmaster/features/dashboard/presentation/pages/dashboard.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final List<GetPage> pages = [
    GetPage(name: RouteName.dashboardRouteName, page: () => DashboardPage()),
  ];
}

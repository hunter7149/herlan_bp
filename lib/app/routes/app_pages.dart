import 'package:get/get.dart';

import '../modules/customerscreen/bindings/customerscreen_binding.dart';
import '../modules/customerscreen/views/customerscreen_view.dart';
import '../modules/dashboardsceen/bindings/dashboardsceen_binding.dart';
import '../modules/dashboardsceen/views/dashboardsceen_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/loginsceen/bindings/loginsceen_binding.dart';
import '../modules/loginsceen/views/loginsceen_view.dart';
import '../modules/offerscreen/bindings/offerscreen_binding.dart';
import '../modules/offerscreen/views/offerscreen_view.dart';
import '../modules/qrscreen/bindings/qrscreen_binding.dart';
import '../modules/qrscreen/views/qrscreen_view.dart';
import '../modules/scanscreen/bindings/scanscreen_binding.dart';
import '../modules/scanscreen/views/scanscreen_view.dart';
import '../modules/splashscreen/bindings/splashscreen_binding.dart';
import '../modules/splashscreen/views/splashscreen_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASHSCREEN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASHSCREEN,
      page: () => const SplashscreenView(),
      binding: SplashscreenBinding(),
    ),
    GetPage(
        name: _Paths.LOGINSCEEN,
        page: () => const LoginsceenView(),
        binding: LoginsceenBinding(),
        transitionDuration: Duration(seconds: 2),
        transition: Transition.circularReveal),
    GetPage(
      name: _Paths.DASHBOARDSCEEN,
      page: () => const DashboardsceenView(),
      binding: DashboardsceenBinding(),
    ),
    GetPage(
      name: _Paths.SCANSCREEN,
      page: () => ScanscreenView(),
      binding: ScanscreenBinding(),
    ),
    GetPage(
      name: _Paths.CUSTOMERSCREEN,
      page: () => const CustomerscreenView(),
      binding: CustomerscreenBinding(),
    ),
    GetPage(
      name: _Paths.OFFERSCREEN,
      page: () => const OfferscreenView(),
      binding: OfferscreenBinding(),
    ),
    GetPage(
      name: _Paths.QRSCREEN,
      page: () => const QrscreenView(),
      binding: QrscreenBinding(),
    ),
  ];
}

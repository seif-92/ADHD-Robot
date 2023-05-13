import 'package:get/get.dart';

import '../modules/alarm/bindings/alarm_binding.dart';
import '../modules/alarm/views/alarm_view.dart';
import '../modules/control/bindings/control_binding.dart';
import '../modules/control/views/control_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/readings/bindings/readings_binding.dart';
import '../modules/readings/views/readings_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.READINGS,
      page: () => const ReadingsView(),
      binding: ReadingsBinding(),
    ),
    GetPage(
      name: _Paths.CONTROL,
      page: () => const ControlView(),
      binding: ControlBinding(),
    ),
    GetPage(
      name: _Paths.ALARM,
      page: () => const AlarmView(),
      binding: AlarmBinding(),
    ),
    GetPage(
      name: _Paths.PROFILE,
      page: () => const ProfileView(),
      binding: ProfileBinding(),
    ),
  ];
}

import 'package:get/get.dart';
import 'package:rolarm_app/app/modules/alarm/controllers/alarm_controller.dart';

import '../../control/controllers/control_controller.dart';
import '../../profile/controllers/profile_controller.dart';
import '../../readings/controllers/readings_controller.dart';
import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ReadingsController>(
          () => ReadingsController(),
    );
    Get.lazyPut<ControlController>(
          () => ControlController(),
    );
    Get.lazyPut<AlarmController>(
          () => AlarmController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}

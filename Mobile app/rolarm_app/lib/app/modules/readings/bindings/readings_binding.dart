import 'package:get/get.dart';

import '../controllers/readings_controller.dart';

class ReadingsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReadingsController>(
      () => ReadingsController(),
    );
  }
}

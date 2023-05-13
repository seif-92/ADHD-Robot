import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';
import 'package:get/get.dart';

class ControlController extends GetxController {
  //TODO: Implement ControlController
  RxDouble _x = 100.0.obs;
  RxDouble _y = 100.0.obs;
  double ballSize = 20.0;
  double step = 10.0;
  JoystickMode _joystickMode = JoystickMode.all;



  updateBall(StickDragDetails details){
    _x.value = _x.value + step * details.x;
    _y.value = _y.value + step * details.y;
  }
  updateX(){
    _x.value = MediaQuery.of(Get.context!).size.width / 2 - ballSize / 2;
  }
}

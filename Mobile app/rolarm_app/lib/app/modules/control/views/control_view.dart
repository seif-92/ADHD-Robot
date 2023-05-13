
import 'package:flutter/material.dart';
import 'package:flutter_joystick/flutter_joystick.dart';

import 'package:get/get.dart';

import '../controllers/control_controller.dart';

class ControlView extends GetView<ControlController> {
  const ControlView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Control'),
        centerTitle: true,
      ),
      body: Column(
        children: [
         Spacer(),
          Center(
            child: Joystick(listener: (StickDragDetails details) {
              controller.updateBall(details);
            },),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }
}

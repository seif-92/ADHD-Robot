import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../alarm/views/alarm_view.dart';
import '../../control/views/control_view.dart';
import '../../profile/views/profile_view.dart';
import '../../readings/views/readings_view.dart';
import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Obx(() => BottomNavyBar(
            selectedIndex: controller.selectedIndex.value,
            showElevation: true, // use this to remove appBar's elevation
            onItemSelected: (index) => controller.changeSelectedPage(index),
            items: [
              BottomNavyBarItem(
                icon: Icon(Icons.home),
                title: Text('Home'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.gamepad),
                  title: Text('Control'),
                  activeColor: Colors.purpleAccent),
              BottomNavyBarItem(
                  icon: Icon(Icons.alarm),
                  title: Text('Alarm'),
                  activeColor: Colors.pink),
              BottomNavyBarItem(
                  icon: Icon(Icons.person),
                  title: Text('Profile'),
                  activeColor: Colors.blue),
            ],
          )),
      body: PageView(
        onPageChanged: (index) => controller.selectedIndex.value = index,
        controller: controller.pageController,
        children: [
          ReadingsView(),
          ControlView(),
          AlarmView(),
          ProfileView(),
        ],
      ),
    );
  }
}

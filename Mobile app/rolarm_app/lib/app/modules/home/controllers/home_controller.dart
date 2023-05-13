import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxInt selectedIndex = 0.obs;
  PageController? pageController;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    pageController = PageController();
  }

  void changeSelectedPage(int index){
    selectedIndex.value = index;
    pageController!.animateToPage(index,
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }
}

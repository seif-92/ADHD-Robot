import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolarm_app/app/data/services/firebase_services.dart';

import '../../../data/models/readings_model.dart';

class ReadingsController extends GetxController {

  Rx<num> temp = 30.0.obs;
  Rx<num> humidity = 0.0.obs;
  RxBool isFire = false.obs;
  RxBool isGas = false.obs;
  RxBool isLoading = false.obs;
  Rx<ReadingsModel?> readings = Rx(null);
  final firebaseServices = Get.find<FirebaseServices>();

  @override
  void onInit() async {
    super.onInit();
    readings.bindStream(firebaseServices.readingsStream());
    await fetchInfo();
  }
  // }
  // Color getTemperatureColor(){
  //   if(temp.value < 20){
  //     return Colors.cyan;
  //   }else if(temp.value < 24){
  //     return Colors.green;
  //   }else if(temp.value < 28){
  //     return Colors.deepOrange;
  //   }else{
  //     return Colors.red;
  //   }
  // }

  double getTemp(){
    double percent = ((temp.value)/30.0);
    print("percent: $percent");
    return percent > 1 ? 1 : percent;
  }

  fetchInfo() async {
    ReadingsModel? readings = await firebaseServices.fetchInfo();
    if(readings != null){
      temp.value = readings.temp;
      humidity.value = readings.humidity;
      isFire.value = readings.isFire;
      isGas.value = readings.isGas;
    }
  }

}

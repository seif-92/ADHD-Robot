import 'package:bot_toast/bot_toast.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:rolarm_app/app/data/models/alarm_model.dart';

import '../../../data/services/firebase_services.dart';

class AlarmController extends GetxController {
  TextEditingController dateController = TextEditingController();
  RxList<AlarmModel> prevAlarms = RxList([]);
  final firebaseServices = Get.find<FirebaseServices>();

  @override
  void onInit() async {
    super.onInit();
    await getPrevAlarms();

  }

  Future<void> setAlarm() async {
    DateTime date = DateTime.parse(dateController.text);
    print(date);
    Timestamp t = Timestamp.fromDate(date);
    AlarmModel alarm = AlarmModel(true, t);
    BotToast.showLoading();
    await Get.find<FirebaseServices>().setAlarm(alarm);
    await Future.delayed(Duration(milliseconds: 1500));
    await getPrevAlarms();
    BotToast.closeAllLoading();
  }
  getPrevAlarms() async {
    BotToast.showLoading();
    prevAlarms.value = await firebaseServices.fetchPreviousAlarms();
    BotToast.closeAllLoading();

  }
  String formatDate(DateTime d){
    final f = new DateFormat('yyyy-MM-dd hh:mm');
    final String formatted = f.format(d);
    return formatted;
  }

}

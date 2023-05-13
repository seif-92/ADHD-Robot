import 'package:bot_toast/bot_toast.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolarm_app/app/data/services/firebase_services.dart';

import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Get.put(FirebaseServices());
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      builder: BotToastInit(),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      navigatorObservers: [BotToastNavigatorObserver()],
    ),
  );
}

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:rolarm_app/app/modules/readings/views/widgets/reading_card.dart';

import '../controllers/readings_controller.dart';

class ReadingsView extends GetView<ReadingsController> {
  const ReadingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD9F6F5F5),
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            children: [
              SizedBox(height: 12,),
              Image.asset("assets/logo.png"),
              controller.isLoading.value ?
                  Center(child: CircularProgressIndicator(),)
                  :Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Obx(()=>ReadingCard(
                          title: 'Temperature',
                          image: "assets/temp.svg",
                          value: controller.getTemp(),
                          valueText: '${controller.readings.value?.temp} °C',
                          color: Colors.grey.withOpacity(0.4),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Obx(()=>ReadingCard(
                          title: 'Humidity',
                          value: 0,
                          image: "assets/humidity.svg",
                          valueText: '${controller.readings.value?.humidity} %',
                          color: Colors.grey.withOpacity(0.4),
                        )),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(()=>ReadingCard(
                          title: 'Gas',
                          value: 0,
                          image: "assets/gas.svg",
                          valueText: '${controller.readings.value?.isGas ?? false ? "Detected" : "Not detected"}',
                          color: Colors.grey.withOpacity(0.4),
                        )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: Obx(()=>ReadingCard(
                          title: 'Fire',
                          value: 0,
                          image: "assets/fire.svg",
                          valueText: '${controller.readings.value?.isFire ?? false ?  "Detected" : "Not detected"}',
                          color: Colors.grey.withOpacity(0.4),
                        )),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

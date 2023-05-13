import 'package:date_time_picker/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rolarm_app/app/modules/alarm/views/previous_alarms.dart';

import '../controllers/alarm_controller.dart';

class AlarmView extends GetView<AlarmController> {
  const AlarmView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AlarmView'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Set new alarm: "),
              SizedBox(
                height: 4,
              ),
              DateTimePicker(
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 1.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.black, width: 1.0),
                  ),
                ),
                controller: controller.dateController,
                type: DateTimePickerType.dateTime,
                firstDate: DateTime.now(),
                lastDate: DateTime(2100),
                dateLabelText: 'Date',
                onChanged: (val) => print(val),
                validator: (val) {
                  print(val);
                  return null;
                },
                onSaved: (val) => print(val),
              ),
              Row(
                children: [
                  Spacer(),
                  ElevatedButton(onPressed: ()async =>await controller.setAlarm(), child: Text("Save alarm")),
                ],
              ),
              SizedBox(height: 10,),
              PreviousAlarms(),

            ],
          ),
        ),
      ),
    );
  }
}

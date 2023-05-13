import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rolarm_app/app/modules/alarm/controllers/alarm_controller.dart';

class PreviousAlarms extends GetView<AlarmController> {
  const PreviousAlarms({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Previous Alarms:"),
        SizedBox(height: 10,),
        Obx(()=>ListView.builder(itemCount: controller.prevAlarms.length,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (BuildContext context, int index){
              return Container(
                padding: EdgeInsets.symmetric(vertical: 6),
                margin: EdgeInsets.symmetric(vertical: 6),
                child: Row(
                  children: [
                    Text(controller.formatDate(controller.prevAlarms[index].date.toDate()), style: TextStyle(fontSize: 16,),),
                    Spacer(),
                    Text(controller.prevAlarms[index].isActive ? "In progress" : "Finished"),
                    SizedBox(width: 5,),
                  ],
                ),
              );
            }

        )),],
    );
  }
}

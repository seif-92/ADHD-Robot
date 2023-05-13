import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:rolarm_app/app/data/models/alarm_model.dart';
import 'package:rolarm_app/app/data/models/readings_model.dart';

class FirebaseServices extends GetxService {
  final db = FirebaseFirestore.instance;

  Future<ReadingsModel?> fetchInfo() async {
    DocumentSnapshot snapshot = await db.collection("readings").doc(
        "H1njwJlDkg1D0SJ97jFG").get();
    Map<String, dynamic> data = snapshot.data() as Map<String, dynamic>;
    if (snapshot.data() != null) {
      return ReadingsModel(
          data['temp'], data['humidity'], data['isFire'], data['isGas']);
    }
  }

  setAlarm(AlarmModel alarm) async {
    // Create a new user with a first and last name
    final alarmMap = <String, dynamic>{
      "time": alarm.date,
      "isActive": alarm.isActive,
    };

// Add a new document with a generated ID
    db.collection("alarms").add(alarmMap);
  }

  Future<List<AlarmModel>> fetchPreviousAlarms() async {
    QuerySnapshot querySnapshot = await db.collection("alarms").orderBy("time", descending: false).get();
    List<AlarmModel> alarms = [];
    for (var doc in querySnapshot.docs) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      alarms.add(AlarmModel(data['isActive'], data['time']));
    }
    return alarms;
  }

  Stream<ReadingsModel> readingsStream() {
    return db.collection("readings")
        .doc("H1njwJlDkg1D0SJ97jFG")
        .snapshots()
        .map((DocumentSnapshot doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      ReadingsModel readingsModel = ReadingsModel(data['temp'],
          data['humidity'], data['isFire'], data['isGas']);
      return readingsModel;
    });
  }
}
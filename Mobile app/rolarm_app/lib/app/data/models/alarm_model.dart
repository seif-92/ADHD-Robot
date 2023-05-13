import 'package:cloud_firestore/cloud_firestore.dart';

class AlarmModel {
  final bool isActive;
  final Timestamp date;

  AlarmModel(this.isActive, this.date);
}
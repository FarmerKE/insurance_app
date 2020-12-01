import 'package:flutter/material.dart';

class MotorPersonalInfo with ChangeNotifier {
  final String city;
  final String idNumber;
  final String kraPin;
  final String regNo;
  final String logBook;

  MotorPersonalInfo({
    @required this.city,
    @required this.idNumber,
    @required this.kraPin,
    @required this.regNo,
    @required this.logBook,
  });
}

import 'package:flutter/material.dart';

class InsurancePolicy with ChangeNotifier{
  final String id;
  final String fName;
  final String lName;
  final String insuranceClass;
  final String description;
  final String sumAssured;
  final double premium;
  final DateTime policyStart;
  final DateTime policyEnd;

  InsurancePolicy({
    @required this.fName,
    @required this.lName,
    @required this.id,
    @required this.insuranceClass,
    @required this.description,
    @required this.sumAssured,
    @required this.premium,
    @required this.policyStart,
    @required this.policyEnd,
  });
}

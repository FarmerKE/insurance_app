import 'package:flutter/material.dart';

class UserCarDetails with ChangeNotifier {
  final String carBrand;
  final String carType;
  final double carValue;
  final int yearOfManufacture;
  final DateTime startDate;

  UserCarDetails({
    @required this.carBrand,
    @required this.carType,
    @required this.carValue,
    @required this.yearOfManufacture,
    @required this.startDate,
  });

  // void addCarDetails(UserCarDetails usercardetails) {
  //   final newCarDetails = UserCarDetails(
  //     carBrand: usercardetails.carBrand,
  //     carType: usercardetails.carType,
  //     carValue: usercardetails.carValue,
  //     yearOfManufacture: usercardetails.yearOfManufacture,
  //   );
  // }
}

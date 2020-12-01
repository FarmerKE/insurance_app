import 'package:flutter/material.dart';

class PremiumCalculator extends ChangeNotifier {
  final double carValue;

  PremiumCalculator({this.carValue});

  double _basicPremium = 0;
  double _excessProtector = 0;
  double _pvt = 0;
  double _aa = 0;
  double _grossPremium = 0;
  double _phcf = 0;
  double _levy = 0;
  double _exciseDuty = 0;
  double _netPremium = 0;

  String calculateBasicPremium(carValue) {
    _basicPremium = carValue * 0.04;
    return _basicPremium.toStringAsFixed(1);
  }

  String calculateExcessProtectorZero(carValue) {
    _excessProtector = 0;
    return _excessProtector.toStringAsFixed(1);
  }

  String calculateExcessProtector(carValue, statusExcess) {
    _excessProtector = statusExcess == true ? carValue * 0.00045 : 0;
    return _excessProtector.toStringAsFixed(1);
  }

  String calculatePVT(carValue, statusPVT) {
    _pvt = statusPVT == true ? carValue * 0.0004 : 0;
    return _pvt.toStringAsFixed(1);
  }

  String roadRescueService(statusRoadRescue) {
    _aa = statusRoadRescue == true ? 3000.0 : 0;
    return _aa.toStringAsFixed(1);
  }

  String calculateGrossPremium(carValue) {
    _grossPremium = _basicPremium + _pvt + _excessProtector + _aa;
    return _grossPremium.toStringAsFixed(1);
  }

  String calculatePHCF() {
    _phcf = _grossPremium * 0.00045;
    return _phcf.toStringAsFixed(1);
  }

  String calculateLevy() {
    _levy = _grossPremium * 0.0004;
    return _levy.toStringAsFixed(1);
  }

  String calculateExciseDuty() {
    _exciseDuty = 40.0;
    return _exciseDuty.toStringAsFixed(1);
  }

  // String calculateNetPremium(carValue) {
  //   _netPremium =
  //       ((carValue * 0.04) + (carValue * 0.00045) + (carValue * 0.0004)) +
  //           ((carValue * 0.04) + (carValue * 0.00045) + (carValue * 0.0004)) *
  //               0.00045 +
  //           ((carValue * 0.04) + (carValue * 0.00045) + (carValue * 0.0004)) *
  //               0.0004 +
  //           40;
  //   return _netPremium.toStringAsFixed(1);
  // }

  String calculateNetPremium() {
    _netPremium = _grossPremium + _phcf + _levy + _exciseDuty;
    return _netPremium.toStringAsFixed(1);
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }
}

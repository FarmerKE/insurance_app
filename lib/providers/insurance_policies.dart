import 'package:flutter/cupertino.dart';
import 'insurance_policy.dart';

class InsurancePolicies with ChangeNotifier {
  List<InsurancePolicy> _policies = [
    InsurancePolicy(
      id: 'INS1',
      fName: 'Kennedy',
      lName: 'Koko',
      insuranceClass: 'Motor Insurance',
      description: 'KCA123B',
      sumAssured: '1000000',
      premium: 20000,
      policyStart: DateTime.now(),
      policyEnd: DateTime.now().add(Duration(days: 364)),
    ),
    InsurancePolicy(
      id: 'INS3',
      fName: 'Kennedy',
      lName: 'Koko',
      insuranceClass: 'Home Insurance',
      description: 'Langata',
      sumAssured: '2000000',
      premium: 100000,
      policyStart: DateTime.now(),
      policyEnd: DateTime.now().add(Duration(days: 29)),
    ),
    InsurancePolicy(
      id: 'INS4',
      fName: 'Nedy',
      lName: 'Koko',
      insuranceClass: 'Motor Insurance',
      description: 'KCC123A',
      sumAssured: '1000000',
      premium: 20000,
      policyStart: DateTime.now().subtract(Duration(days: 400)),
      policyEnd: DateTime.now().subtract(Duration(days: 200)),
    ),
  ];

  List<InsurancePolicy> get policies {
    return [..._policies];
  }

  void addPolicy() {
    //_policies.add(value);
    notifyListeners();
  }
}

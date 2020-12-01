import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';

import '../providers/insurance_policies.dart';

import '../screens/motor_claims_screen.dart';

const detailsTextStyle = TextStyle(
  fontSize: 16.0,
  letterSpacing: 1.2,
);

Widget _buildDetailButton(Function onTap, String label, double widthSize) {
  return Container(
    width: widthSize,
    padding: EdgeInsets.all(15.0),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(30.0),
      color: Colors.blue,
    ),
    child: GestureDetector(
      onTap: onTap,
      child: Center(
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
            letterSpacing: 1.5,
          ),
        ),
      ),
    ),
  );
}

class MyPolicyScreen extends StatelessWidget {
  static const String id = 'my_policy_screen';

  @override
  Widget build(BuildContext context) {
    final policyId = ModalRoute.of(context).settings.arguments as String;
    final loadedPolicies =
        Provider.of<InsurancePolicies>(context).policies.firstWhere(
              (policy) => policy.id == policyId,
            );

    return Scaffold(
      appBar: AppBar(
        title: Text(loadedPolicies.description),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Details for policy ' + loadedPolicies.description,
                        style: TextStyle(
                          fontSize: 18.0,
                          letterSpacing: 1.4,
                        ),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Name: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.fName + (" ") + loadedPolicies.lName,
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Insurance type: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.insuranceClass,
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Description: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.description,
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sum Assured: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.sumAssured,
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Premium: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.premium.toString(),
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Start Date: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            DateFormat.yMMMd()
                                .format(loadedPolicies.policyStart),
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'End Date: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            DateFormat.yMMMd().format(loadedPolicies.policyEnd),
                            style: detailsTextStyle,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Status: ',
                            style: detailsTextStyle,
                          ),
                          Text(
                            loadedPolicies.policyEnd.isAfter(DateTime.now())
                                ? 'ACTIVE'
                                : 'INACTIVE',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: loadedPolicies.policyEnd
                                      .isAfter(DateTime.now())
                                  ? Colors.green
                                  : Colors.red[900],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Divider(
                  color: Colors.white,
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: loadedPolicies.policyEnd.isAfter(DateTime.now())
                      ? Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            _buildDetailButton(
                              () {
                                Navigator.pushNamed(
                                    context, MotorClaimsScreen.id);
                              },
                              'File a Claim',
                              MediaQuery.of(context).size.width * 1,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            _buildDetailButton(
                              () {},
                              'Download Insurance Certificate',
                              MediaQuery.of(context).size.width * 1,
                            ),
                            SizedBox(
                              height: 15.0,
                            ),
                            _buildDetailButton(
                              () {},
                              'Download Policy Document',
                              MediaQuery.of(context).size.width * 1,
                            ),
                          ],
                        )
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              width: double.infinity,
                              child: Text(
                                'POLICY IS INACTIVE',
                                style: TextStyle(
                                  fontSize: 18.0,
                                  letterSpacing: 1.3,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 20.0),
                            Image(
                              image: AssetImage('assets/images/bedtime.jpg'),
                              fit: BoxFit.fill,
                            )
                          ],
                        ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

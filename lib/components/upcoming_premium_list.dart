import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/insurance_policies.dart';

import '../components/upcoming_premium_card.dart';

class UpcomingPremiumList extends StatelessWidget {
  const UpcomingPremiumList({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final policiesData = Provider.of<InsurancePolicies>(context);
    final policies = policiesData.policies;

    return // DateTime.now().difference(policies[index].policyEnd).inDays < 30
        //     ? UpcomingPremiumCard(
        //         policyNumber: '100',
        //         sumAssured: '20190',
        //         premium: '21029',
        //         dueDate: '201902',
        //       ):
        Column(
      children: [
        Text(
          'Insurance at your Fingertips',
          style: TextStyle(
            fontSize: 18.0,
            letterSpacing: 1.2,
            color: Colors.grey[350],
          ),
        ),
        SizedBox(height: 15.0),
        Container(
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.9,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(
              Radius.circular(15.0),
            ),
          ),
          child: Image(
            image: AssetImage('assets/images/camel.jpg'),
            fit: BoxFit.fill,
          ),
        ),
      ],
    );
  }
}

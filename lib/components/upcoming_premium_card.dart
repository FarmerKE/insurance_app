import 'package:flutter/material.dart';

import '../utilities/constants.dart';

import '../components/upcoming_prem_detail.dart';

class UpcomingPremiumCard extends StatelessWidget {
  final String policyNumber;
  final String sumAssured;
  final String premium;
  final String dueDate;

  UpcomingPremiumCard({
    @required this.policyNumber,
    @required this.sumAssured,
    @required this.premium,
    @required this.dueDate,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Text(
                'Policy Number:',
                style: TextStyle(
                  color: kActiveCardColour,
                  fontSize: 16.0,
                ),
              ),
              SizedBox(
                width: 30.0,
              ),
              Text(
                policyNumber,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
        ),
        Divider(
          color: Colors.white,
          thickness: 0.5,
          indent: 10,
          endIndent: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            UpcomingPremiumDetails(
              topLabel: sumAssured,
              bottomLabel: 'SUM ASSURED',
            ),
            UpcomingPremiumDetails(
              topLabel: premium,
              bottomLabel: 'PREMIUM AMOUNT',
            ),
            UpcomingPremiumDetails(
              topLabel: dueDate,
              bottomLabel: 'DUE DATE',
            ),
          ],
        )
      ],
    );
  }
}

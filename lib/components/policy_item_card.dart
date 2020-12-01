import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../screens/my_policy_screen.dart';

import '../utilities/constants.dart';

class PolicyItemCard extends StatelessWidget {
  final String id;
  final String insuranceClass;
  final String description;
  final String premium;
  final String status;

  PolicyItemCard({
    @required this.id,
    @required this.insuranceClass,
    @required this.description,
    @required this.premium,
    @required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          MyPolicyScreen.id,
          arguments: id,
        );
      },
      child: Card(
        elevation: 5,
        margin: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 5.0,
        ),
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundColor: kInactiveCardColour,
            foregroundColor: status == 'Active' ? Colors.green : Colors.red,
            child: FittedBox(
              child: Icon(
                insuranceClass == 'MOTOR INSURANCE'
                    ? FontAwesomeIcons.car
                    : FontAwesomeIcons.home,
              ),
            ),
          ),
          title: Text(
            insuranceClass,
          ),
          subtitle: Row(
            children: [
              Text(
                description,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                '- ' + status,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: status == 'Active' ? Colors.green : Colors.red,
                ),
              ),
            ],
          ),
          trailing: Text(
            premium,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ),
    );
  }
}

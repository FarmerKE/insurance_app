import 'package:flutter/material.dart';

class UpcomingPremiumDetails extends StatelessWidget {
  UpcomingPremiumDetails({this.topLabel, this.bottomLabel});

  final String topLabel;
  final String bottomLabel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            topLabel,
            style: TextStyle(
              color: Color(0xFFFEFEFD),
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            bottomLabel,
            style: TextStyle(
              color: Color(0xFFF37A28),
              fontSize: 12.0,
            ),
          )
        ],
      ),
    );
  }
}

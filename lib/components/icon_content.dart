import 'package:flutter/material.dart';

const labelTextStyle = TextStyle(
  color: Color(0xFFFEFEFD),
  fontSize: 16.0,
  fontWeight: FontWeight.bold,
);

class IconContent extends StatelessWidget {
  IconContent({this.icon, this.label});
  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            children: <Widget>[
              Icon(
                icon,
                size: 40.0,
              ),
              SizedBox(
                width: 15.0,
              ),
              Text(
                label,
                style: labelTextStyle,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

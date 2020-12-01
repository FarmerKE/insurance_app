import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  SectionTitle({@required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(9.0, 8.0, 8.0, 3.0),
          child: Container(
            alignment: Alignment.bottomLeft,
            child: Text(
              label,
              style: TextStyle(
                color: Color(0xFFFEFEFD),
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
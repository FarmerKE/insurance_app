import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({@required this.label, this.onTap});

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            label,
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        color: Colors.blue,
        height: MediaQuery.of(context).size.height * 0.09,
        width: double.infinity,
        margin: EdgeInsets.only(top: 15.0),
        padding: EdgeInsets.only(bottom: 10.0),
      ),
    );
  }
}

import 'package:flutter/material.dart';

const listStyle = TextStyle(
  fontSize: 18.0,
);

class DrawerListTile extends StatelessWidget {
  DrawerListTile(
      {@required this.label, @required this.icon, @required this.onPress});

  final String label;
  final IconData icon;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon),
      title: Text(
        label,
        style: listStyle,
      ),
      onTap: onPress,
    );
  }
}

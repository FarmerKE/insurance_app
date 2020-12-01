import 'package:flutter/material.dart';

import '../screens/welcome_screen.dart';

class SettingsPage extends StatelessWidget {
  static const String id = 'settings_page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextDetails(
                label: 'About MyInsure',
                onTap: () {
                  print('Tapped bish');
                },
              ),
              TextDetails(
                label: 'FAQ',
                onTap: () {},
              ),
              TextDetails(
                label: 'Terms and Conditions',
                onTap: () {},
              ),
              TextDetails(
                label: 'Our Policy Statement',
                onTap: () {},
              ),
              SizedBox(
                height: 15.0,
              ),
              Divider(
                color: Colors.grey,
                indent: 10.0,
                endIndent: 10.0,
                height: 1.5,
                thickness: 0.8,
              ),
              TextDetails(
                label: 'Log Out',
                onTap: () {
                  Navigator.pushNamed(context, WelcomeScreen.id);
                },
              ),
              SizedBox(
                height: 15.0,
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Version. 1.0.0: ',
                      style: TextStyle(
                        fontSize: 15.0,
                      ),
                    ),
                    Text(
                      'The cheesy centre.',
                      style: TextStyle(
                        fontStyle: FontStyle.italic,
                        fontSize: 15.0,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class TextDetails extends StatelessWidget {
  final Function onTap;
  final String label;

  TextDetails({@required this.label, @required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(13.0),
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 18.0,
          ),
        ),
      ),
    );
  }
}

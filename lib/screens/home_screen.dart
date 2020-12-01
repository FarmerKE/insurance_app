import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
//import 'package:intl/intl.dart';

import '../components/reusable_card.dart';
import '../components/section_title.dart';
import '../components/policy_item_list.dart';
import '../components/upcoming_premium_list.dart';

import '../screens/car_details.dart';
import '../screens/settings.dart';

import '../utilities/constants.dart';

enum Insurance {
  motor,
  home,
}

class InputPage extends StatefulWidget {
  static const String id = 'home_screen';

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Insurance selectedInsurance;

  Widget _buildListTile(String label, IconData icon, Function onTap) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        elevation: 8.0,
        child: InkWell(
          splashColor: selectedInsurance == Insurance.motor
              ? kActiveCardColour
              : kInactiveCardColour,
          onTap: onTap,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.50,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                children: [
                  Center(
                    child: CircleAvatar(
                      backgroundColor: Colors.black87,
                      radius: 30.0,
                      child: Icon(
                        icon,
                        size: 25.0,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    label,
                    style: TextStyle(
                      fontSize: 16.0,
                      letterSpacing: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(0.0, 8.0, 8.0, 3.0),
                child: Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.075,
                        child: Image(
                          image: AssetImage('assets/images/myinsurelogo.png'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          print('Settings has been tapped');
                          Navigator.pushNamed(context, SettingsPage.id);
                        },
                      ),
                    ],
                  ),
                ),
              ),
              SectionTitle(label: 'OUR SERVICES'),
              Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    _buildListTile('MOTOR \nINSURANCE', FontAwesomeIcons.car,
                        () {
                      setState(() {
                        selectedInsurance = Insurance.motor;
                        Navigator.pushNamed(context, CarDetails.id);
                      });
                    }),
                    _buildListTile('HOME \nINSURANCE', FontAwesomeIcons.home,
                        () {
                      setState(() {
                        selectedInsurance = Insurance.home;
                      });
                    }),
                  ],
                ),
              ),
              SectionTitle(label: 'UPCOMING PREMIUM'),
              ReusableCard(
                colour: Colors.transparent,
                cardChild: UpcomingPremiumList(),
              ),
              SectionTitle(label: 'MY POLICIES'),
              ReusableCard(
                colour: Color(0xFF272B2E),
                cardChild: Column(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: PolicyItemList(),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

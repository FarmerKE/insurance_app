import 'package:flutter/material.dart';

import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

import 'personal_info.dart';

// import '../utilities/constants.dart';

const premiumOverviewTextStyle = TextStyle(
  fontSize: 16.0,
  fontWeight: FontWeight.w400,
);

class MotorPurchaseTPO extends StatefulWidget {
  static const String id = 'review_your_quote';

  @override
  _MotorPurchaseTPOState createState() => _MotorPurchaseTPOState();
}

class _MotorPurchaseTPOState extends State<MotorPurchaseTPO> {
  double basicPremium = 5370;

  String phcf() {
    final phcf = basicPremium * 0.0045;
    return phcf.toStringAsFixed(1);
  }

  String levies() {
    final levies = basicPremium * 0.004;
    return levies.toStringAsFixed(1);
  }

  double exciseDuty = 40;

  String annualPremium() {
    final ap = basicPremium +
        (basicPremium * 0.0045) +
        (basicPremium * 0.004) +
        exciseDuty;
    return ap.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Review your quote'),
      ),
      body: Column(
        children: <Widget>[
          SingleChildScrollView(
            child: ReusableCard(
              colour: Color(0xFF272B2E),
              cardChild: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.all(10.0),
                        child: RichText(
                          text: TextSpan(
                            text: 'KES  ',
                            style: TextStyle(
                              fontSize: 25.0,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: annualPremium(),
                                style: TextStyle(
                                  fontSize: 60.0,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    thickness: 1.3,
                    indent: 20.0,
                    endIndent: 20.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 3.0),
                        child: Text(
                          'Review your Third Party Motor Insurance Plan',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 5.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: ReusableCard(
              colour: Color(0xFF272B2E),
              cardChild: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      Center(
                        child: Container(
                          child: Text(
                            'Premium Overview'.toUpperCase(),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 15.0,
                            ),
                          ),
                        ),
                      ),
                      Divider(
                        thickness: 1.3,
                      ),
                      PremiumOverview(
                        label: 'Basic Premium:',
                        value: '$basicPremium',
                      ),
                      PremiumOverview(
                        label: 'PHCF:',
                        value: phcf(),
                      ),
                      PremiumOverview(
                        label: 'Levies:',
                        value: levies(),
                      ),
                      PremiumOverview(
                        label: 'Excise Duty:',
                        value: '$exciseDuty',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              Navigator.pushNamed(context, PersonalInfo.id);
            },
            label: 'Tell us about you',
          ),
        ],
      ),
    );
  }
}

class ToggleButtonList extends StatelessWidget {
  final String label;
  final String price;

  ToggleButtonList({this.label, this.price});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0, 10.0, 25.0, 10.0),
      child: Column(
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(price),
        ],
      ),
    );
  }
}

class PremiumOverview extends StatelessWidget {
  final String label;
  final String value;

  PremiumOverview({@required this.label, @required this.value});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: premiumOverviewTextStyle,
        ),
        Text(
          value,
          style: premiumOverviewTextStyle,
        ),
      ],
    );
  }
}

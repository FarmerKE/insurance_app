import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/calculator_brain.dart';

import '../components/reusable_card.dart';
import '../components/bottom_button.dart';

import '../screens/personal_info.dart';

import '../utilities/constants.dart';

class MotorPurchase extends StatefulWidget {
  static const String id = 'review_your_quote';

  final double carValue;

  MotorPurchase({@required this.carValue});

  @override
  _MotorPurchaseState createState() => _MotorPurchaseState();
}

class _MotorPurchaseState extends State<MotorPurchase> {
  bool _excessChecked = false;
  bool _pvtChecked = false;
  bool _aaKenya = false;

  // List<bool> isSelected;

  // @override
  // void initState() {
  //   super.initState();
  //   isSelected = [
  //     true,
  //     false,
  //   ];
  // }

  @override
  Widget build(BuildContext context) {
    String netPremium =
        Provider.of<PremiumCalculator>(context).calculateNetPremium();
    String grossPremium = Provider.of<PremiumCalculator>(context)
        .calculateGrossPremium(widget.carValue);
    String exciseDuty =
        Provider.of<PremiumCalculator>(context).calculateExciseDuty();
    String excessProtector = Provider.of<PremiumCalculator>(context)
        .calculateExcessProtector(widget.carValue, _excessChecked);
    String pvt = Provider.of<PremiumCalculator>(context)
        .calculatePVT(widget.carValue, _pvtChecked);
    String roadRescue =
        Provider.of<PremiumCalculator>(context).roadRescueService(_aaKenya);
    String phcf = Provider.of<PremiumCalculator>(context).calculatePHCF();
    String levies = Provider.of<PremiumCalculator>(context).calculateLevy();

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
                            text: 'KES ',
                            style: TextStyle(
                              fontSize: 20.0,
                              color: Colors.white,
                            ),
                            children: <TextSpan>[
                              TextSpan(
                                text: '$netPremium',
                                style: TextStyle(
                                  fontSize: 50.0,
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
                          'Customise your Comprehensive Motor Insurance Plan',
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.all(10.0),
                    child: Column(
                      children: [
                        SwitchListTile.adaptive(
                          title: Row(
                            children: [
                              Text('Excess Protector: $excessProtector'),
                            ],
                          ),
                          value: _excessChecked,
                          onChanged: (bool value) {
                            setState(() {
                              _excessChecked = value;
                            });
                          },
                          activeTrackColor: kActiveCardColour,
                          activeColor: kActiveCardColour,
                        ),
                        SwitchListTile.adaptive(
                          title: Row(
                            children: [
                              Text('Political Violence & Terror: $pvt'),
                            ],
                          ),
                          value: _pvtChecked,
                          onChanged: (bool value) {
                            setState(
                              () {
                                _pvtChecked = value;
                                print(_pvtChecked);
                              },
                            );
                          },
                          activeTrackColor: kActiveCardColour,
                          activeColor: kActiveCardColour,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Divider(
                          thickness: 1.3,
                        ),
                        SizedBox(height: 10.0),
                        Text(
                          'ROAD RESCUE SERVICES',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        SwitchListTile.adaptive(
                          title: Row(
                            children: [
                              Text('AA Kenya: 3000.0'),
                            ],
                          ),
                          value: _aaKenya,
                          onChanged: (bool value) {
                            setState(
                              () {
                                _aaKenya = value;
                                print(_aaKenya);
                              },
                            );
                          },
                          activeTrackColor: kActiveCardColour,
                          activeColor: Colors.blue,
                        ),
                        // ToggleButtons(
                        //   borderRadius: BorderRadius.circular(30.0),
                        //   children: [
                        //     ToggleButtonList(
                        //       label: 'None',
                        //       price: '',
                        //     ),
                        //     // ToggleButtonList(
                        //     //   label: 'Infama',
                        //     //   price: '6000',
                        //     // ),
                        //     ToggleButtonList(
                        //       label: 'AA',
                        //       price: '3500',
                        //     ),
                        //   ],
                        //   isSelected: isSelected,
                        //   onPressed: (index) {
                        //     setState(
                        //       () {
                        //         for (int i = 0; i < isSelected.length; i++) {
                        //           if (i == index) {
                        //             isSelected[i] = true;
                        //           } else {
                        //             isSelected[i] = false;
                        //           }
                        //         }
                        //         print(isSelected);
                        //         print(index);
                        //       },
                        //     );
                        //   },
                        //   selectedColor: Colors.white,
                        //   fillColor: Colors.blue,
                        // ),
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
                        value: '$grossPremium',
                      ),
                      PremiumOverview(
                        label: 'PHCF:',
                        value: '$phcf',
                      ),
                      PremiumOverview(
                        label: 'Levies:',
                        value: '$levies',
                      ),
                      PremiumOverview(
                        label: 'Excise Duty',
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
            label: 'Tell us about your car',
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
              fontSize: 16.0,
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
          style: kPremiumOverviewTextStyle,
        ),
        Text(
          value,
          style: kPremiumOverviewTextStyle,
        ),
      ],
    );
  }
}

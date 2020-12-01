import 'package:flutter/material.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

import '../providers/motor_personal_info.dart';

class PersonalInfo extends StatefulWidget {
  static const String id = 'personal_info';

  @override
  _PersonalInfoState createState() => _PersonalInfoState();
}

class _PersonalInfoState extends State<PersonalInfo> {
  final _cityFocusNode = FocusNode();
  final _idNumberFocusNode = FocusNode();
  final _kraPinFocusNode = FocusNode();
  final _regNumberFocusNode = FocusNode();
  final _logBookFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var _personalInfo = MotorPersonalInfo(
    city: '',
    idNumber: '',
    kraPin: '',
    regNo: '',
    logBook: '',
  );

  @override
  void dispose() {
    _cityFocusNode.dispose();
    _idNumberFocusNode.dispose();
    _kraPinFocusNode.dispose();
    _regNumberFocusNode.dispose();
    _logBookFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final _isValid = _form.currentState.validate();
    if (!_isValid) {
      return;
    }
    _form.currentState.save();
    print(_personalInfo.city);
    print(_personalInfo.idNumber);
    print(_personalInfo.kraPin);
    print(_personalInfo.regNo);
    print(_personalInfo.logBook);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Input your personal info'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(8.0, 8.0, 8.0, 0.0),
              child: Text(
                'Tell us more about you',
                style: TextStyle(
                  fontSize: 20.0,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: SingleChildScrollView(
              child: ReusableCard(
                colour: Color(0xFF272B2E),
                cardChild: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Form(
                    key: _form,
                    child: Column(
                      children: [
                        TextFormField(
                          focusNode: _idNumberFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'What is your City';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            icon: Icon(Icons.location_city),
                            hintText: 'City Of Kariobangi',
                            labelText: 'Town or City',
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_idNumberFocusNode);
                          },
                          onSaved: (value) {
                            _personalInfo = MotorPersonalInfo(
                              city: value,
                              idNumber: _personalInfo.idNumber,
                              kraPin: _personalInfo.kraPin,
                              regNo: _personalInfo.regNo,
                              logBook: _personalInfo.logBook,
                            );
                          },
                        ),
                        TextFormField(
                          focusNode: _kraPinFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your identification number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            icon: Icon(Icons.credit_card),
                            hintText: '12XXXXXXXXXX',
                            labelText: 'ID Number',
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_kraPinFocusNode);
                          },
                          onSaved: (value) {
                            _personalInfo = MotorPersonalInfo(
                              city: _personalInfo.city,
                              idNumber: value,
                              kraPin: _personalInfo.kraPin,
                              regNo: _personalInfo.regNo,
                              logBook: _personalInfo.logBook,
                            );
                          },
                        ),
                        TextFormField(
                          focusNode: _regNumberFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your KRA Pin';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            icon: Icon(Icons.card_travel),
                            hintText: 'ABXXXX2XX8XX',
                            labelText: 'KRA Pin',
                          ),
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_logBookFocusNode);
                          },
                          onSaved: (value) {
                            _personalInfo = MotorPersonalInfo(
                              city: _personalInfo.city,
                              idNumber: _personalInfo.idNumber,
                              kraPin: value,
                              regNo: _personalInfo.regNo,
                              logBook: _personalInfo.logBook,
                            );
                          },
                        ),
                        TextFormField(
                          focusNode: _logBookFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Car Registration';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.next,
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.car),
                            hintText: 'KCA001A',
                            labelText: 'Car Registration Number',
                          ),
                          onSaved: (value) {
                            _personalInfo = MotorPersonalInfo(
                              city: _personalInfo.city,
                              idNumber: _personalInfo.idNumber,
                              kraPin: _personalInfo.kraPin,
                              regNo: value,
                              logBook: value,
                            );
                          },
                        ),
                        TextFormField(
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter your Log Book Number';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.text,
                          textInputAction: TextInputAction.done,
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.car),
                            hintText: 'ABXXXX2XX8XX',
                            labelText: 'Log Book Number',
                          ),
                          onSaved: (value) {
                            _personalInfo = MotorPersonalInfo(
                              city: _personalInfo.city,
                              idNumber: _personalInfo.idNumber,
                              kraPin: _personalInfo.kraPin,
                              regNo: _personalInfo.regNo,
                              logBook: value,
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          BottomButton(
            onTap: () {
              _saveForm();
            },
            label: 'Pay for your Product',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:provider/provider.dart';

import '../components/bottom_button.dart';
import '../components/reusable_card.dart';

import '../models/calculator_brain.dart';

import '../providers/motor_user_details.dart';

import '../screens/view_quote.dart';

// enum MotorInsuranceType { comprehensive, tpaf, tpo }

class CarDetails extends StatefulWidget {
  static const String id = 'car_details';
  @override
  _CarDetailsState createState() => _CarDetailsState();
}

class _CarDetailsState extends State<CarDetails> {
  //MotorInsuranceType _insurance = MotorInsuranceType.comprehensive;

  final _carTypeFocusNode = FocusNode();
  final _carValueFocusNode = FocusNode();
  final _yearOfManFocusNode = FocusNode();
  final _startDateFocusNode = FocusNode();
  final _form = GlobalKey<FormState>();
  var carDetails = UserCarDetails(
    carBrand: '',
    carType: '',
    carValue: 0,
    yearOfManufacture: 2020,
    startDate: DateTime.now(),
  );

  @override
  void dispose() {
    _carTypeFocusNode.dispose();
    _carValueFocusNode.dispose();
    _yearOfManFocusNode.dispose();
    _startDateFocusNode.dispose();
    super.dispose();
  }

  void _saveForm() {
    final isValid = _form.currentState.validate();
    if (!isValid) {
      return;
    }
    _form.currentState.save();
    print(carDetails.carBrand);
    print(carDetails.carType);
    print(carDetails.carValue);
    print(carDetails.yearOfManufacture);
    print(carDetails.startDate);

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => MotorQuotes(
          basicPremium: Provider.of<PremiumCalculator>(context)
              .calculateBasicPremium(carDetails.carValue),
          carValue: carDetails.carValue,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        title: Text('CAR DETAILS'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'Tell us a little about your car.',
                style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 1.2,
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
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Car Brand';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_carTypeFocusNode);
                          },
                          onSaved: (value) {
                            carDetails = UserCarDetails(
                              carBrand: value,
                              carType: carDetails.carType,
                              carValue: carDetails.carValue,
                              yearOfManufacture: carDetails.yearOfManufacture,
                              startDate: carDetails.startDate,
                            );
                          },
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.truck),
                            hintText: 'Toyota',
                            labelText: 'Car Brand',
                          ),
                        ),
                        TextFormField(
                          focusNode: _carTypeFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Car Type';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.text,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_carValueFocusNode);
                          },
                          onSaved: (value) {
                            carDetails = UserCarDetails(
                              carBrand: carDetails.carBrand,
                              carType: value,
                              carValue: carDetails.carValue,
                              yearOfManufacture: carDetails.yearOfManufacture,
                              startDate: carDetails.startDate,
                            );
                          },
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.car),
                            hintText: 'Corolla',
                            labelText: 'Car Type',
                          ),
                        ),
                        TextFormField(
                          focusNode: _carValueFocusNode,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter your Car Value';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid number';
                            }
                            if (double.parse(value) <= 300000) {
                              return 'Please enter car value greater than 300,000';
                            }
                            return null;
                          },
                          keyboardType: TextInputType.number,
                          textInputAction: TextInputAction.next,
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_yearOfManFocusNode);
                          },
                          // onChanged: (newValue) {
                          //   Provider.of<CarValue>(context).changeValue(
                          //     double.parse(newValue),
                          //   );
                          // },
                          onSaved: (value) {
                            carDetails = UserCarDetails(
                              carBrand: carDetails.carBrand,
                              carType: carDetails.carType,
                              carValue: double.parse(value),
                              yearOfManufacture: carDetails.yearOfManufacture,
                              startDate: carDetails.startDate,
                            );
                          },
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.dollarSign),
                            hintText: '1000000',
                            labelText: 'Car Value',
                          ),
                        ),
                        TextFormField(
                          focusNode: _yearOfManFocusNode,
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(4),
                          ],
                          onFieldSubmitted: (_) {
                            FocusScope.of(context)
                                .requestFocus(_startDateFocusNode);
                          },
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Add year of Manufacture';
                            }
                            if (double.tryParse(value) == null) {
                              return 'Please enter a valid year';
                            }
                            if (double.parse(value) <= 2000) {
                              return 'Please enter a Year Of Manufacture';
                            }
                            return null;
                          },
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.number,
                          onSaved: (value) {
                            carDetails = UserCarDetails(
                              carBrand: carDetails.carBrand,
                              carType: carDetails.carType,
                              carValue: carDetails.carValue,
                              yearOfManufacture: int.parse(value),
                              startDate: carDetails.startDate,
                            );
                          },
                          decoration: InputDecoration(
                            icon: Icon(FontAwesomeIcons.calendarAlt),
                            hintText: '2012',
                            labelText: 'Year of Manufacture',
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        DateTimeField(
                          focusNode: _startDateFocusNode,
                          decoration: InputDecoration(
                            labelText: 'Choose Start Date',
                            icon: Icon(FontAwesomeIcons.calendar),
                          ),
                          format: DateFormat("yyyy-MM-dd"),
                          onSaved: (value) {
                            carDetails = UserCarDetails(
                              carBrand: carDetails.carBrand,
                              carType: carDetails.carType,
                              carValue: carDetails.carValue,
                              yearOfManufacture: carDetails.yearOfManufacture,
                              startDate: value,
                            );
                          },
                          onShowPicker: (context, currentValue) {
                            return showDatePicker(
                              context: context,
                              initialDate: currentValue ?? DateTime.now(),
                              firstDate: DateTime.now(),
                              lastDate: DateTime(2100),
                            );
                          },
                        ),
                        // SizedBox(
                        //   height: 15.0,
                        // ),
                        // Row(
                        //   children: [
                        //     Text(
                        //       'What Insurance Class are you looking for?',
                        //       style: TextStyle(
                        //         fontSize: 18.0,
                        //         fontWeight: FontWeight.bold,
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        // Column(
                        //   children: [
                        //     RadioListTile(
                        //       title: const Text('Comprehensive'),
                        //       value: MotorInsuranceType.comprehensive,
                        //       groupValue: _insurance,
                        //       onChanged: (MotorInsuranceType value) {
                        //         setState(() {
                        //           _insurance = value;
                        //         });
                        //       },
                        //     ),
                        //     RadioListTile(
                        //       title: const Text('Third Party & Fire'),
                        //       value: MotorInsuranceType.tpaf,
                        //       groupValue: _insurance,
                        //       onChanged: (MotorInsuranceType value) {
                        //         setState(() {
                        //           _insurance = value;
                        //         });
                        //       },
                        //     ),
                        //     RadioListTile(
                        //       title: const Text('Third Party Only'),
                        //       value: MotorInsuranceType.tpo,
                        //       groupValue: _insurance,
                        //       onChanged: (MotorInsuranceType value) {
                        //         setState(() {
                        //           _insurance = value;
                        //         });
                        //       },
                        //     ),
                        //   ],
                        // ),
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
            label: 'Get a quote',
          ),
        ],
      ),
    );
  }
}

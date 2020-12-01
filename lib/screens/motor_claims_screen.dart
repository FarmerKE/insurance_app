import 'package:flutter/material.dart';
import 'package:dropdown_formfield/dropdown_formfield.dart';

class MotorClaimsScreen extends StatefulWidget {
  static const String id = 'motor_claims_screen';

  @override
  _MotorClaimsScreenState createState() => _MotorClaimsScreenState();
}

class _MotorClaimsScreenState extends State<MotorClaimsScreen> {
  String _claimType;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Motor Claims'),
      ),
      body: Container(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Form(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'County Name',
                      labelText: 'County',
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'District Name',
                      labelText: 'District',
                    ),
                    textInputAction: TextInputAction.next,
                    keyboardType: TextInputType.text,
                  ),
                  DropDownFormField(
                    titleText: 'Claim Type',
                    hintText: 'Please Choose One',
                    value: _claimType,
                    onSaved: (value) {
                      setState(() {
                        _claimType = value;
                      });
                    },
                    onChanged: (value) {
                      setState(() {
                        _claimType = value;
                      });
                    },
                    dataSource: [
                      {
                        "display": "Collision",
                        "value": "Collision",
                      },
                      {
                        "display": "Windscreen Damage",
                        "value": "Windscreen Damage",
                      }
                    ],
                    textField: 'display',
                    valueField: 'value',
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

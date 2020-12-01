import 'package:flutter/material.dart';

import '../components/reusable_card.dart';

// import '../providers/motor_user_details.dart';

import '../screens/review_your_quote.dart';
import '../screens/review_your_quote_tpo.dart';

const cardColour = Color(0xFF1F2326);

class MotorQuotes extends StatelessWidget {
  final String basicPremium;
  final double carValue;

  MotorQuotes({
    @required this.basicPremium,
    @required this.carValue,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Quotes'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(
                alignment: Alignment.bottomRight,
                child: Text(
                  'Underwtitten by Junkland Insurance Company',
                  style: TextStyle(fontSize: 12.0),
                  textAlign: TextAlign.left,
                ),
              ),
            ),
            ReusableCard(
              cardChild: MotorQuoteDesign(
                labelTitle: 'MyInsure Comprehensive Cover',
                productDescription:
                    '\nDamage to vehicle \nAccidental vehicle damage',
                premium: basicPremium,
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MotorPurchase(
                        carValue: carValue,
                      ),
                    ),
                  );
                },
              ),
              colour: cardColour,
            ),
            ReusableCard(
              cardChild: MotorQuoteDesign(
                labelTitle: 'MyInsure Third Party Fire and Theft',
                productDescription: '\nTheft and fire \nProperty damage',
                premium: '7,800',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MotorPurchaseTPO(),
                    ),
                  );
                },
              ),
              colour: cardColour,
            ),
            ReusableCard(
              cardChild: MotorQuoteDesign(
                labelTitle: 'MyInsure Third Party Only',
                productDescription:
                    '\nThird party property damage \nThird party bodily injury',
                premium: '5,300',
                onPress: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MotorPurchaseTPO(),
                    ),
                  );
                },
              ),
              colour: cardColour,
            ),
          ],
        ),
      ),
    );
  }
}

//Widget for product displayed
class MotorQuoteDesign extends StatelessWidget {
  MotorQuoteDesign({
    @required this.labelTitle,
    @required this.productDescription,
    @required this.onPress,
    this.premium,
  });

  final String labelTitle;
  final String productDescription;
  final String premium;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            children: <Widget>[
              Text(
                labelTitle,
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
        Divider(
          height: 10.0,
          thickness: 1.0,
          indent: 10,
          endIndent: 10,
        ),
        Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  RichText(
                    text: TextSpan(
                      text: 'Product covers:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: productDescription,
                          style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 14.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                  RichText(
                    text: TextSpan(
                      text: 'KES ',
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.white,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: premium,
                          style: TextStyle(
                            fontSize: 35.0,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 3.0, 8.0, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              FlatButton(
                textColor: Colors.orange,
                onPressed: () {
                  print('Check out more');
                },
                child: Text('More Details'),
              ),
              FlatButton(
                color: Colors.blue,
                onPressed: onPress,
                child: Text('Buy this Product'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import './models/calculator_brain.dart';

import './providers/insurance_policies.dart';
import './providers/motor_user_details.dart';

import './screens/car_details.dart';
import './screens/home_screen.dart';
import './screens/settings.dart';
import './screens/sign_up_screen.dart.dart';
import './screens/welcome_screen.dart';
import './screens/my_policy_screen.dart';
import './screens/personal_info.dart';
import './screens/motor_claims_screen.dart';
// import './screens/review_your_quote.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: InsurancePolicies(),
        ),
        ChangeNotifierProvider.value(
          value: UserCarDetails(
            carBrand: '',
            carType: '',
            carValue: 0,
            yearOfManufacture: 2012,
            startDate: DateTime.now(),
          ),
        ),
        ChangeNotifierProvider.value(
          value: PremiumCalculator(),
        )
      ],
      child: MaterialApp(
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: Color(0xFF272B2E),
        ),
        initialRoute: WelcomeScreen.id,
        routes: {
          WelcomeScreen.id: (context) => WelcomeScreen(),
          Signup.id: (context) => Signup(),
          InputPage.id: (context) => InputPage(),
          CarDetails.id: (context) => CarDetails(),
          SettingsPage.id: (context) => SettingsPage(),
          MyPolicyScreen.id: (context) => MyPolicyScreen(),
          // MotorPurchase.id: (context) => MotorPurchase(),
          PersonalInfo.id: (context) => PersonalInfo(),
          MotorClaimsScreen.id: (context) => MotorClaimsScreen(),
        },
      ),
    );
  }
}

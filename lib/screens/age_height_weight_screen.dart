import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components.dart';

class AgeHeightWeightScreen extends StatefulWidget {
  const AgeHeightWeightScreen({super.key});

  @override
  State<AgeHeightWeightScreen> createState() => _AgeHeightWeightScreenState();
}

class _AgeHeightWeightScreenState extends State<AgeHeightWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Top texts column of bottom area
            const Column(
              children: [
                Text(
                  'Sign In',
                  style: kLargeTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Please enter email and password for login',
                  style: kSmallTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

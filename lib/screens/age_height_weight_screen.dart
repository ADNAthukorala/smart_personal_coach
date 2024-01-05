import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/reusable_card_with_slider.dart';

class AgeHeightWeightScreen extends StatefulWidget {
  const AgeHeightWeightScreen({super.key});

  @override
  State<AgeHeightWeightScreen> createState() => _AgeHeightWeightScreenState();
}

class _AgeHeightWeightScreenState extends State<AgeHeightWeightScreen> {
  //Declare variables to store user age, height and weight and assign default values for them.
  int age = 18;
  int height = 120;
  int weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADNA'),
        backgroundColor: kBlueThemeColor,
      ),
      body: Padding(
        //Adding padding to screen
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Top texts column of bottom area
            const Column(
              children: [
                Text(
                  'Let us known you better',
                  style: kLargeTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Let us know you better to help boost your workout results',
                  style: kSmallTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //User's data getting card
            ReusableCardWithSlider(
              text1: 'Age',
              text2: age.toString(),
              text3: 'years',
              value: age.toDouble(),
              min: 2.0,
              max: 200.0,
              onChanged: (double newAge) {
                setState(() {
                  age = newAge.round();
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}


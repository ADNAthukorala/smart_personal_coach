import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/reusable_card_with_slider.dart';
import 'package:smart_personal_coach/screens/body_areas_selection_screen.dart';

class AgeHeightWeightScreen extends StatefulWidget {
  const AgeHeightWeightScreen({super.key});

  @override
  State<AgeHeightWeightScreen> createState() => _AgeHeightWeightScreenState();
}

class _AgeHeightWeightScreenState extends State<AgeHeightWeightScreen> {
  // Declare variables to store user age, height and weight and assign default values for them.
  int age = 18;
  int height = 120;
  double weight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        //Adding padding to screen
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            //Topic
            const Column(
              children: [
                Text(
                  'Let us known you better',
                  style: kLargeBlackTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Let us know you better to help boost your workout results',
                  style: kSmallGreyColorDescriptionTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            const Spacer(),
            //Getting the user's age
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
            const SizedBox(height: 12.0),
            //Getting the user's height
            ReusableCardWithSlider(
              text1: 'Height',
              text2: height.toString(),
              text3: 'cm',
              value: height.toDouble(),
              min: 60.0,
              max: 280.0,
              onChanged: (double newHeight) {
                setState(() {
                  height = newHeight.round();
                });
              },
            ),
            const SizedBox(height: 12.0),
            //Getting the user's weight
            ReusableCardWithSlider(
              text1: 'Weight',
              text2: weight.toStringAsFixed(1),
              text3: 'kg',
              value: weight,
              min: 10.0,
              max: 300.0,
              onChanged: (double newWeight) {
                setState(() {
                  weight = newWeight;
                });
              },
            ),
            const Spacer(flex: 4),
            // Next button
            NextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FullBodyScreen(),
                  ),
                );
              },
              style: kNextButtonStyle,
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/reusable_card_with_slider.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/body_areas_selection_screen.dart';

class AgeHeightWeightScreen extends StatefulWidget {
  const AgeHeightWeightScreen({super.key});

  @override
  State<AgeHeightWeightScreen> createState() => _AgeHeightWeightScreenState();
}

class _AgeHeightWeightScreenState extends State<AgeHeightWeightScreen> {
  // Declare variables to store user age, height and weight and assign default values for them.
  int userAge = 18;
  int userHeight = 120;
  double userWeight = 60;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppBarTitle(
          screenId: 2,
        ),
      ),
      body: Padding(
        //Adding padding to screen
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            // Title and description
            const TitleAndDescriptionHolder(
              title: 'Let us known you better',
              description:
                  'Let us know you better to help boost your workout results',
            ),
            const Spacer(),
            //Getting the user's age
            ReusableCardWithSlider(
              text1: 'Age',
              text2: userAge.toString(),
              text3: 'years',
              value: userAge.toDouble(),
              min: 2.0,
              max: 200.0,
              onChanged: (double newAge) {
                setState(() {
                  userAge = newAge.round();
                });
              },
            ),
            const SizedBox(height: 12.0),
            //Getting the user's height
            ReusableCardWithSlider(
              text1: 'Height',
              text2: userHeight.toString(),
              text3: 'cm',
              value: userHeight.toDouble(),
              min: 60.0,
              max: 280.0,
              onChanged: (double newHeight) {
                setState(() {
                  userHeight = newHeight.round();
                });
              },
            ),
            const SizedBox(height: 12.0),
            //Getting the user's weight
            ReusableCardWithSlider(
              text1: 'Weight',
              text2: userWeight.toStringAsFixed(1),
              text3: 'kg',
              value: userWeight,
              min: 10.0,
              max: 300.0,
              onChanged: (double newWeight) {
                setState(() {
                  userWeight = newWeight;
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

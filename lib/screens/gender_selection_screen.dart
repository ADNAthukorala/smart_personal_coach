import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/age_height_weight_screen.dart';

//Create a enum for gender
enum Gender { male, female, notSelected }

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  //Variable to store the user's gender
  Gender selectedGender = Gender.notSelected;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Top image of gender selection screen
          const Flexible(
            flex: 1,
            child:
                TopImage(imageUrl: 'images/gender_selection_screen_image.jpg'),
          ),
          //Bottom components of gender selection screen
          Flexible(
            flex: 2,
            //Adding padding to the bottom area
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              //Adding all the components at the bottom to a column
              child: Column(
                children: [
                  //Topic
                  const Text(
                    "What's your gender?",
                    style: kLargeTextStyle,
                  ),
                  //Add some space between topic and male, female buttons row
                  const Spacer(),
                  //Male, female buttons holding row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Male button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //If the male button is clicked, selected gender = Male
                            selectedGender = Gender.male;
                          });
                        },
                        style: kGenderSelectionButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll(
                              selectedGender == Gender.male
                                  ? kBlueThemeColor
                                  : kWhiteThemeColor),
                        ),
                        child: Text(
                          'Male',
                          style: kLargeTextStyle.copyWith(
                              color: selectedGender == Gender.male
                                  ? kWhiteThemeColor
                                  : kBlueThemeColor),
                        ),
                      ),
                      //Female button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //If the male button is clicked, selected gender = Female
                            selectedGender = Gender.female;
                          });
                        },
                        style: kGenderSelectionButtonStyle.copyWith(
                          backgroundColor: MaterialStatePropertyAll(
                              selectedGender == Gender.female
                                  ? kPinkThemeColor
                                  : kWhiteThemeColor),
                        ),
                        child: Text(
                          'Female',
                          style: kLargeTextStyle.copyWith(
                              color: selectedGender == Gender.female
                                  ? kWhiteThemeColor
                                  : kPinkThemeColor),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(flex: 8),
                  //Next button
                  NextButton(
                    onPressed: selectedGender == Gender.notSelected
                        ? null
                        : () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const AgeHeightWeightScreen(),
                              ),
                            );
                          },
                    style: kNextButtonStyle.copyWith(
                        backgroundColor: MaterialStatePropertyAll(
                            selectedGender == Gender.notSelected
                                ? kGreyThemeColor02
                                : kBlueThemeColor)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

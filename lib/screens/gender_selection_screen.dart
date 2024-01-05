import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/age_height_weight_screen.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  //Variable to store the user's gender
  String selectedGender = 'Not selected yet';

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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //Topic
                  const Text(
                    "What's your gender?",
                    style: kLargeTextStyle,
                  ),
                  //Add some space between topic and male, female buttons row
                  const SizedBox(height: 8.0),
                  //Male, female buttons holding row
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      //Male button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //If the male button is clicked, selected gender = Male
                            selectedGender = 'Male';
                          });
                        },
                        style: kRoundedCornerButtonStyle.copyWith(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150.0, 70.0)),
                          backgroundColor: MaterialStatePropertyAll(
                              selectedGender == 'Male'
                                  ? kBlueThemeColor
                                  : kWhiteThemeColor),
                        ),
                        child: Text(
                          'Male',
                          style: kLargeTextStyle.copyWith(
                              color: selectedGender == 'Male'
                                  ? kWhiteThemeColor
                                  : kBlackThemeColor),
                        ),
                      ),
                      //Female button
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            //If the male button is clicked, selected gender = Female
                            selectedGender = 'Female';
                          });
                        },
                        style: kRoundedCornerButtonStyle.copyWith(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150.0, 70.0)),
                          backgroundColor: MaterialStatePropertyAll(
                              selectedGender == 'Female'
                                  ? kPinkThemeColor
                                  : kWhiteThemeColor),
                        ),
                        child: Text(
                          'Female',
                          style: kLargeTextStyle.copyWith(
                              color: selectedGender == 'Female'
                                  ? kWhiteThemeColor
                                  : kBlackThemeColor),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  //Go forward button
                  ElevatedButton(
                    onPressed: selectedGender == 'Not selected yet'
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
                    style: kRoundedCornerButtonStyle.copyWith(
                        fixedSize:
                            const MaterialStatePropertyAll(Size(120.0, 50.0)),
                        backgroundColor: MaterialStatePropertyAll(
                            selectedGender == 'Not selected yet'
                                ? kGreyThemeColor02
                                : kBlueThemeColor)),
                    child: const Text(
                      'Go',
                      style: TextStyle(
                        fontFamily: kThemeFontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: kWhiteThemeColor,
                      ),
                    ),
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

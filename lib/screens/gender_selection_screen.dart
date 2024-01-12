import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/age_height_weight_screen.dart';

/// Create a enum for gender
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
      appBar: AppBar(
          centerTitle: true,
          title: const SizedBox(
            width: kAppBarSizedBoxWidth,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  size: kAppBarActiveRoundedIconSize,
                  color: kBlueThemeColor,
                ),
                Icon(Icons.circle, size: kAppBarRoundedIconSize, color: kGreyThemeColor02,),
                Icon(Icons.circle, size: kAppBarRoundedIconSize, color: kGreyThemeColor02,),
                Icon(Icons.circle, size: kAppBarRoundedIconSize, color: kGreyThemeColor02,),
                Icon(Icons.circle, size: kAppBarRoundedIconSize, color: kGreyThemeColor02,),
              ],
            ),
          )),
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
              padding: const EdgeInsets.fromLTRB(
                  kPadding16, kPadding8, kPadding16, kPadding16),
              //Adding all the components at the bottom to a column
              child: Column(
                children: [
                  // Title and description
                  const TitleAndDescriptionHolder(
                    title: "What's your gender?",
                    description: '',
                  ),
                  // Add some space between title and male, female buttons row
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
                          style: kLargeBlackTitleTextStyle.copyWith(
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
                          style: kLargeBlackTitleTextStyle.copyWith(
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

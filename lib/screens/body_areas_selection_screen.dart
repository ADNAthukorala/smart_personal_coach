import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/main_goal_screen.dart';

enum BodyArea { arms, back, chest, abs, legs, fullBody }

class FullBodyScreen extends StatefulWidget {
  const FullBodyScreen({super.key});

  @override
  State<FullBodyScreen> createState() => _FullBodyScreenState();
}

class _FullBodyScreenState extends State<FullBodyScreen> {
  /// Declare a list to store user selected body areas.
  List<BodyArea> userSelectedBodyAreas = [];

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
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarActiveRoundedIconSize,
                  color: kBlueThemeColor,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
                Icon(
                  Icons.circle,
                  size: kAppBarRoundedIconSize,
                  color: kGreyThemeColor02,
                ),
              ],
            ),
          )),
      // Add padding around the main column
      body: Padding(
        padding: const EdgeInsets.all(kPadding16),
        // The main column
        child: Column(
          children: [
            // Title and description
            const TitleAndDescriptionHolder(
              title: 'Please select your focus area',
              description: '',
            ),
            // Add a Spacer between the title and the body area selection
            const Spacer(),
            // Body area selection
            SizedBox(
              // Add height to the container for stable purposes
              height: 496.0,
              // Button bar and body image holder row
              child: Row(
                // Center button bar and image inside the row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flexible button bar
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Select the full body button
                        SelectBodyAreaButton(
                          array: userSelectedBodyAreas,
                          selectedBodyArea: BodyArea.fullBody,
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array length >= 5
                              if (userSelectedBodyAreas.length >= 5) {
                                // If it is true, the bodyAreas array should be empty when this button is clicked
                                userSelectedBodyAreas.clear();
                              } else {
                                // If it false, these body areas should be added to the array
                                userSelectedBodyAreas.clear();
                                userSelectedBodyAreas.add(BodyArea.arms);
                                userSelectedBodyAreas.add(BodyArea.back);
                                userSelectedBodyAreas.add(BodyArea.chest);
                                userSelectedBodyAreas.add(BodyArea.abs);
                                userSelectedBodyAreas.add(BodyArea.legs);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          buttonLabel: 'Full Body',
                        ),
                        // Select arms button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains arms
                              if (userSelectedBodyAreas
                                  .contains(BodyArea.arms)) {
                                // If it is true, remove arms from the array when this button is clicked
                                userSelectedBodyAreas.remove(BodyArea.arms);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                userSelectedBodyAreas.add(BodyArea.arms);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          array: userSelectedBodyAreas,
                          buttonLabel: 'Arms',
                          selectedBodyArea: BodyArea.arms,
                        ),
                        // Select back button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains back
                              if (userSelectedBodyAreas
                                  .contains(BodyArea.back)) {
                                // If it is true, remove back from the array when this button is clicked
                                userSelectedBodyAreas.remove(BodyArea.back);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                userSelectedBodyAreas.add(BodyArea.back);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          array: userSelectedBodyAreas,
                          buttonLabel: 'Back',
                          selectedBodyArea: BodyArea.back,
                        ),
                        // Select chest button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains chest
                              if (userSelectedBodyAreas
                                  .contains(BodyArea.chest)) {
                                // If it is true, remove chest from the array when this button is clicked
                                userSelectedBodyAreas.remove(BodyArea.chest);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                userSelectedBodyAreas.add(BodyArea.chest);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          array: userSelectedBodyAreas,
                          buttonLabel: 'Chest',
                          selectedBodyArea: BodyArea.chest,
                        ),
                        // Select abs button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains abs
                              if (userSelectedBodyAreas
                                  .contains(BodyArea.abs)) {
                                // If it is true, remove abs from the array when this button is clicked
                                userSelectedBodyAreas.remove(BodyArea.abs);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                userSelectedBodyAreas.add(BodyArea.abs);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          array: userSelectedBodyAreas,
                          buttonLabel: 'Abs',
                          selectedBodyArea: BodyArea.abs,
                        ),
                        // Select legs button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains legs
                              if (userSelectedBodyAreas
                                  .contains(BodyArea.legs)) {
                                // If it is true, remove legs from array when this button is clicked
                                userSelectedBodyAreas.remove(BodyArea.legs);
                              } else {
                                // If it false, add legs to the array when this button is clicked
                                userSelectedBodyAreas.add(BodyArea.legs);
                              }
                              print(userSelectedBodyAreas);
                            });
                          },
                          array: userSelectedBodyAreas,
                          buttonLabel: 'Legs',
                          selectedBodyArea: BodyArea.legs,
                        ),
                      ],
                    ),
                  ),
                  // Full body image
                  Image.asset(
                    'images/full_body_image.png',
                    height: 496,
                    width: 243,
                  ),
                ],
              ),
            ),
            // Add spacer between the body area selection and the next button
            const Spacer(flex: 2),
            /// Button to go to the next screen
            NextButton(
              // If the bodyAreas array is empty, this button should be disabled
              onPressed: userSelectedBodyAreas.isEmpty
                  ? null
                  : () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainGoalScreen(),
                        ),
                      );
                    },
              style: kNextButtonStyle.copyWith(
                  // If the bodyAreas array is empty, the background color of this button should be gray
                  backgroundColor: MaterialStatePropertyAll(
                      userSelectedBodyAreas.isEmpty
                          ? kGreyThemeColor02
                          : kBlueThemeColor)),
            ),
          ],
        ),
      ),
    );
  }
}

/// Button to select body areas
class SelectBodyAreaButton extends StatelessWidget {
  const SelectBodyAreaButton({
    super.key,
    required this.array,
    required this.selectedBodyArea,
    required this.onPressed,
    required this.buttonLabel,
  });

  final List<BodyArea> array;
  final BodyArea selectedBodyArea;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectBodyAreaButtonStyle.copyWith(
        backgroundColor: array.contains(selectedBodyArea) || array.length == 5
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectBodyAreaButtonTextStyle.copyWith(
          color: array.contains(selectedBodyArea) || array.length == 5
              ? kWhiteThemeColor
              : kBlueThemeColor,
        ),
      ),
    );
  }
}

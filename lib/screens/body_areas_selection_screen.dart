import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/main_goal_screen.dart';

/// Enum for body areas
enum BodyArea { arms, back, chest, abs, legs, fullBody }

/// Getting the user's preferred body areas to focus on
class BodyAreasSelectionScreen extends StatefulWidget {
  const BodyAreasSelectionScreen({super.key});

  @override
  State<BodyAreasSelectionScreen> createState() =>
      _BodyAreasSelectionScreenState();
}

class _BodyAreasSelectionScreenState extends State<BodyAreasSelectionScreen> {
  /// Declare a list to store user selected body areas.
  final List<BodyArea> _userSelectedBodyAreas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 3,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.all(kPadding16),
        // The main column
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'Please select your focus area/areas',
                description: '',
              ),
            ),

            /// Middle of the screen
            /// Body area selection container
            Expanded(
              child: Center(
                child: ListView(
                  padding: EdgeInsets.zero,
                  shrinkWrap: true,
                  children: [
                    SizedBox(
                      // Add a fixed height to the container
                      height: 496.0,

                      /// Button bar and the body image holder
                      child: Row(
                        // Center button bar and image inside the holder
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ///  The Button bar
                          Expanded(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                /// Select the full body button
                                SelectBodyAreaButton(
                                  array: _userSelectedBodyAreas,
                                  selectedBodyArea: BodyArea.fullBody,
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array length >= 5
                                      if (_userSelectedBodyAreas.length >= 5) {
                                        // If it is true, the bodyAreas array should be empty when this button is clicked
                                        _userSelectedBodyAreas.clear();
                                      } else {
                                        // If it false, these body areas should be added to the array
                                        _userSelectedBodyAreas.clear();
                                        _userSelectedBodyAreas.add(BodyArea.arms);
                                        _userSelectedBodyAreas.add(BodyArea.back);
                                        _userSelectedBodyAreas
                                            .add(BodyArea.chest);
                                        _userSelectedBodyAreas.add(BodyArea.abs);
                                        _userSelectedBodyAreas.add(BodyArea.legs);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  buttonLabel: 'Full Body',
                                ),

                                /// Select arms button
                                SelectBodyAreaButton(
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array contains arms
                                      if (_userSelectedBodyAreas
                                          .contains(BodyArea.arms)) {
                                        // If it is true, remove arms from the array when this button is clicked
                                        _userSelectedBodyAreas
                                            .remove(BodyArea.arms);
                                      } else {
                                        // If it false, add arms to the array when this button is clicked
                                        _userSelectedBodyAreas.add(BodyArea.arms);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  array: _userSelectedBodyAreas,
                                  buttonLabel: 'Arms',
                                  selectedBodyArea: BodyArea.arms,
                                ),

                                /// Select back button
                                SelectBodyAreaButton(
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array contains back
                                      if (_userSelectedBodyAreas
                                          .contains(BodyArea.back)) {
                                        // If it is true, remove back from the array when this button is clicked
                                        _userSelectedBodyAreas
                                            .remove(BodyArea.back);
                                      } else {
                                        // If it false, add arms to the array when this button is clicked
                                        _userSelectedBodyAreas.add(BodyArea.back);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  array: _userSelectedBodyAreas,
                                  buttonLabel: 'Back',
                                  selectedBodyArea: BodyArea.back,
                                ),

                                /// Select chest button
                                SelectBodyAreaButton(
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array contains chest
                                      if (_userSelectedBodyAreas
                                          .contains(BodyArea.chest)) {
                                        // If it is true, remove chest from the array when this button is clicked
                                        _userSelectedBodyAreas
                                            .remove(BodyArea.chest);
                                      } else {
                                        // If it false, add arms to the array when this button is clicked
                                        _userSelectedBodyAreas
                                            .add(BodyArea.chest);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  array: _userSelectedBodyAreas,
                                  buttonLabel: 'Chest',
                                  selectedBodyArea: BodyArea.chest,
                                ),

                                /// Select abs button
                                SelectBodyAreaButton(
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array contains abs
                                      if (_userSelectedBodyAreas
                                          .contains(BodyArea.abs)) {
                                        // If it is true, remove abs from the array when this button is clicked
                                        _userSelectedBodyAreas
                                            .remove(BodyArea.abs);
                                      } else {
                                        // If it false, add arms to the array when this button is clicked
                                        _userSelectedBodyAreas.add(BodyArea.abs);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  array: _userSelectedBodyAreas,
                                  buttonLabel: 'Abs',
                                  selectedBodyArea: BodyArea.abs,
                                ),

                                /// Select legs button
                                SelectBodyAreaButton(
                                  onPressed: () {
                                    setState(() {
                                      // Check whether bodyAreas array contains legs
                                      if (_userSelectedBodyAreas
                                          .contains(BodyArea.legs)) {
                                        // If it is true, remove legs from array when this button is clicked
                                        _userSelectedBodyAreas
                                            .remove(BodyArea.legs);
                                      } else {
                                        // If it false, add legs to the array when this button is clicked
                                        _userSelectedBodyAreas.add(BodyArea.legs);
                                      }
                                      print(_userSelectedBodyAreas);
                                    });
                                  },
                                  array: _userSelectedBodyAreas,
                                  buttonLabel: 'Legs',
                                  selectedBodyArea: BodyArea.legs,
                                ),
                              ],
                            ),
                          ),

                          /// Full body image
                          Image.asset(
                            'images/full_body_image.png',
                            height: 496, // Fixed height to the image
                            width: 243, // Fixed width to the image
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
              ),
              child: NextButton(
                // If the bodyAreas array is empty, this button should be disabled
                onPressed: _userSelectedBodyAreas.isEmpty
                    ? null
                    : () {
                        // When the button is clicked, navigate to the main goal screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const MainGoalScreen(),
                          ),
                        );
                      },
                style: kNextButtonStyle.copyWith(
                    // If the bodyAreas array is empty, the background color of this button should be grey
                    backgroundColor: MaterialStatePropertyAll(
                        _userSelectedBodyAreas.isEmpty
                            ? kGreyThemeColor02
                            : kBlueThemeColor)),
              ),
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

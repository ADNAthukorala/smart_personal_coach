import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/generate_workout_plan_exercises/generate_the_workout_plan_exercises.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';

/// Updating the user's preferred body areas to focus on
class UpdateBodyAreasSelectionScreen extends StatefulWidget {
  const UpdateBodyAreasSelectionScreen({
    super.key,
    required this.userSelectedBodyAreas,
    required this.loggedInUserEmail,
    required this.userLevel,
  });

  final List<String> userSelectedBodyAreas;
  final String? loggedInUserEmail;
  final String userLevel;

  @override
  State<UpdateBodyAreasSelectionScreen> createState() =>
      _UpdateBodyAreasSelectionScreenState();
}

class _UpdateBodyAreasSelectionScreenState
    extends State<UpdateBodyAreasSelectionScreen> {
  // Declare a list to store user selected body areas.
  late final List<String> _updatedUserSelectedBodyAreas;

  /// Update focused body areas
  Future<void> updateFocusedBodyAreas(
      List<String> updatedFocusedBodyAreas) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.loggedInUserEmail);

      // Update the main goal
      await documentRef.update({
        'focusedBodyAreas': updatedFocusedBodyAreas,
        'finishedDaysOfCurrentWorkoutPlan': 0,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void initState() {
    _updatedUserSelectedBodyAreas = widget.userSelectedBodyAreas;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        backgroundColor: kWhiteThemeColor,
        scrolledUnderElevation: 0,
        elevation: 0,
        shadowColor: kWhiteThemeColor,
        centerTitle: true,
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
          bottom: kPadding16,
        ),
        // The main column
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding16,
              ),
              child: InitialScreensTitleAndDescriptionHolder(
                title: 'Please select your focus area/areas',
                description: '',
              ),
            ),

            /// Middle of the screen
            /// Body area selection container
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: kPadding16,
                  bottom: kPadding16,
                ),
                primary: false,
                children: [
                  /// Selection container
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
                                array: _updatedUserSelectedBodyAreas,
                                selectedBodyArea: "Full Body",
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array length >= 5
                                    if (_updatedUserSelectedBodyAreas.length >=
                                        5) {
                                      // If it is true, the bodyAreas array should be empty when this button is clicked
                                      _updatedUserSelectedBodyAreas.clear();
                                    } else {
                                      // If it false, these body areas should be added to the array
                                      _updatedUserSelectedBodyAreas.clear();
                                      _updatedUserSelectedBodyAreas.add("Arms");
                                      _updatedUserSelectedBodyAreas.add("Back");
                                      _updatedUserSelectedBodyAreas
                                          .add("Chest");
                                      _updatedUserSelectedBodyAreas.add("Abs");
                                      _updatedUserSelectedBodyAreas.add("Legs");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                buttonLabel: "Full Body",
                              ),

                              /// Select arms button
                              SelectBodyAreaButton(
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array contains arms
                                    if (_updatedUserSelectedBodyAreas
                                        .contains("Arms")) {
                                      // If it is true, remove arms from the array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .remove("Arms");
                                    } else {
                                      // If it false, add arms to the array when this button is clicked
                                      _updatedUserSelectedBodyAreas.add("Arms");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                array: _updatedUserSelectedBodyAreas,
                                buttonLabel: "Arms",
                                selectedBodyArea: "Arms",
                              ),

                              /// Select back button
                              SelectBodyAreaButton(
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array contains back
                                    if (_updatedUserSelectedBodyAreas
                                        .contains("Back")) {
                                      // If it is true, remove back from the array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .remove("Back");
                                    } else {
                                      // If it false, add arms to the array when this button is clicked
                                      _updatedUserSelectedBodyAreas.add("Back");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                array: _updatedUserSelectedBodyAreas,
                                buttonLabel: "Back",
                                selectedBodyArea: "Back",
                              ),

                              /// Select chest button
                              SelectBodyAreaButton(
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array contains chest
                                    if (_updatedUserSelectedBodyAreas
                                        .contains("Chest")) {
                                      // If it is true, remove chest from the array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .remove("Chest");
                                    } else {
                                      // If it false, add arms to the array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .add("Chest");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                array: _updatedUserSelectedBodyAreas,
                                buttonLabel: "Chest",
                                selectedBodyArea: "Chest",
                              ),

                              /// Select abs button
                              SelectBodyAreaButton(
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array contains abs
                                    if (_updatedUserSelectedBodyAreas
                                        .contains("Abs")) {
                                      // If it is true, remove abs from the array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .remove("Abs");
                                    } else {
                                      // If it false, add arms to the array when this button is clicked
                                      _updatedUserSelectedBodyAreas.add("Abs");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                array: _updatedUserSelectedBodyAreas,
                                buttonLabel: "Abs",
                                selectedBodyArea: "Abs",
                              ),

                              /// Select legs button
                              SelectBodyAreaButton(
                                onPressed: () {
                                  setState(() {
                                    // Check whether bodyAreas array contains legs
                                    if (_updatedUserSelectedBodyAreas
                                        .contains("Legs")) {
                                      // If it is true, remove legs from array when this button is clicked
                                      _updatedUserSelectedBodyAreas
                                          .remove("Legs");
                                    } else {
                                      // If it false, add legs to the array when this button is clicked
                                      _updatedUserSelectedBodyAreas.add("Legs");
                                    }
                                    // print(_userSelectedBodyAreas);
                                  });
                                },
                                array: _updatedUserSelectedBodyAreas,
                                buttonLabel: "Legs",
                                selectedBodyArea: "Legs",
                              ),
                            ],
                          ),
                        ),

                        /// Full body image
                        Image.asset(
                          'images/full-body-image.png',
                          height: 496, // Fixed height to the image
                          width: 243, // Fixed width to the image
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding16,
              ),
              child: ElevatedButton(
                // If the bodyAreas array is empty, this button should be disabled
                onPressed: _updatedUserSelectedBodyAreas.isEmpty
                    ? null
                    : () async {
                        await updateFocusedBodyAreas(
                            _updatedUserSelectedBodyAreas);
                        await generateTheWorkoutPlan(
                            userLevel: widget.userLevel,
                            loggedInUserEmail: widget.loggedInUserEmail,
                            focusedBodyAreas: _updatedUserSelectedBodyAreas);
                        if (!context.mounted) return;
                        Navigator.pop(context);
                      },
                style: kNextButtonStyle.copyWith(
                    // If the bodyAreas array is empty, the background color of this button should be grey
                    backgroundColor: MaterialStatePropertyAll(
                        _updatedUserSelectedBodyAreas.isEmpty
                            ? kGreyThemeColor02
                            : kAppThemeColor)),
                child: const Text(
                  "Update",
                  style: kNextButtonTextStyle,
                ),
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

  final List<String> array;
  final String selectedBodyArea;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectBodyAreaButtonStyle.copyWith(
        backgroundColor: array.contains(selectedBodyArea) || array.length == 5
            ? const MaterialStatePropertyAll(kAppThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectBodyAreaButtonTextStyle.copyWith(
          color: array.contains(selectedBodyArea) || array.length == 5
              ? kWhiteThemeColor
              : kAppThemeColor,
        ),
      ),
    );
  }
}

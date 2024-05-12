import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';

/// Screen to update the user's main goal
class UpdateMainGoalScreen extends StatefulWidget {
  const UpdateMainGoalScreen({
    super.key,
    required this.userMainGoal,
    required this.loggedInUser,
  });

  final String userMainGoal;
  final User loggedInUser;

  @override
  State<UpdateMainGoalScreen> createState() => _UpdateMainGoalScreenState();
}

class _UpdateMainGoalScreenState extends State<UpdateMainGoalScreen> {
  // Declare a variable to store the user's main goal
  late String _updatedUserMainGoal;

  /// Update main goal
  Future<void> updateMainGoal(String updatedMainGoal) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.loggedInUser.email);

      // Update the main goal
      await documentRef.update({
        'mainGoal': updatedMainGoal,
        'finishedDaysOfCurrentWorkoutPlan': 0,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void initState() {
    _updatedUserMainGoal = widget.userMainGoal;
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

        /// The main column of the screen
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding16,
              ),
              child: InitialScreensTitleAndDescriptionHolder(
                title: 'What are your main goals?',
                description: 'Why do you use this application?',
              ),
            ),

            /// Middle of the screen
            /// Buttons holder
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: kPadding16,
                  bottom: kPadding16,
                ),
                primary: false,
                children: [
                  /// Lose weight button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to lose weight.
                        _updatedUserMainGoal = "Lose Weight";
                      });
                      // print(_userMainGoal);
                    },
                    userMainGoal: _updatedUserMainGoal,
                    selectedMainGoal: "Lose Weight",
                    buttonLabel: "Lose Weight",
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Build muscles button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to build muscles.
                        _updatedUserMainGoal = "Build Muscles";
                      });
                      // print(_userMainGoal);
                    },
                    userMainGoal: _updatedUserMainGoal,
                    selectedMainGoal: "Build Muscles",
                    buttonLabel: "Build Muscles",
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Keep fit button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to keep fit.
                        _updatedUserMainGoal = "Keep Fit";
                      });
                      // print(_userMainGoal);
                    },
                    userMainGoal: _updatedUserMainGoal,
                    selectedMainGoal: "Keep Fit",
                    buttonLabel: "Keep Fit",
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
                onPressed: () {
                  updateMainGoal(_updatedUserMainGoal);
                  Navigator.pop(context);
                },
                style: kNextButtonStyle,
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

/// Create a button to select the user's main goal
class SelectMainGoalButton extends StatelessWidget {
  const SelectMainGoalButton({
    super.key,
    required this.userMainGoal,
    required this.selectedMainGoal,
    this.onPressed,
    required this.buttonLabel,
  });

  final String userMainGoal;
  final String selectedMainGoal;
  final void Function()? onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectCapacityButtonStyle.copyWith(
        // If the selected main goal is equal to the user's main goal, the button color should be blue, otherwise white
        backgroundColor: selectedMainGoal == userMainGoal
            ? const MaterialStatePropertyAll(kAppThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectCapacityButtonTextStyle.copyWith(
          // If the selected main goal is equal to the user's main goal, the button text color should be white, otherwise blue
          color: selectedMainGoal == userMainGoal
              ? kWhiteThemeColor
              : kAppThemeColor,
        ),
      ),
    );
  }
}

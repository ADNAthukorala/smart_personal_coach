import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/app_brain/generate_the_workout_plan.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';

/// Screen to update the user's main goal
class UpdateLevelScreen extends StatefulWidget {
  const UpdateLevelScreen({
    super.key,
    required this.userLevel,
    required this.loggedInUserEmail,
    required this.userSelectedBodyAreas,
  });

  final String userLevel;
  final String? loggedInUserEmail;
  final List<String> userSelectedBodyAreas;

  @override
  State<UpdateLevelScreen> createState() => _UpdateLevelScreenState();
}

class _UpdateLevelScreenState extends State<UpdateLevelScreen> {
  // Declare a variable to store the user's level
  late String _updatedLevel;

  /// Update level
  Future<void> updateLevel(String updatedLevel) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.loggedInUserEmail);

      // Update the main goal
      await documentRef.update({
        'level': updatedLevel,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void initState() {
    _updatedLevel = widget.userLevel;
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
                title: 'What is your level?',
                description: '',
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
                  /// Beginner button
                  SelectLevelButton(
                    onPressed: () {
                      setState(() {
                        _updatedLevel = "Beginner";
                      });
                      // print(_userMainGoal);
                    },
                    level: _updatedLevel,
                    selectedLevel: "Beginner",
                    buttonLabel: "Beginner",
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Intermediate button
                  SelectLevelButton(
                    onPressed: () {
                      setState(() {
                        _updatedLevel = "Intermediate";
                      });
                      // print(_userMainGoal);
                    },
                    level: _updatedLevel,
                    selectedLevel: "Intermediate",
                    buttonLabel: "Intermediate",
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Advanced button
                  SelectLevelButton(
                    onPressed: () {
                      setState(() {
                        _updatedLevel = "Advanced";
                      });
                      // print(_userMainGoal);
                    },
                    level: _updatedLevel,
                    selectedLevel: "Advanced",
                    buttonLabel: "Advanced",
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
                onPressed: () async {
                  await updateLevel(_updatedLevel);
                  await generateTheWorkoutPlan(
                      userLevel: _updatedLevel,
                      loggedInUserEmail: widget.loggedInUserEmail,
                      focusedBodyAreas: widget.userSelectedBodyAreas);
                  if (!context.mounted) return;
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

/// Create a button to select the user's level
class SelectLevelButton extends StatelessWidget {
  const SelectLevelButton({
    super.key,
    required this.level,
    required this.selectedLevel,
    this.onPressed,
    required this.buttonLabel,
  });

  final String level;
  final String selectedLevel;
  final void Function()? onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectCapacityButtonStyle.copyWith(
        backgroundColor: selectedLevel == level
            ? const MaterialStatePropertyAll(kAppThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectCapacityButtonTextStyle.copyWith(
          color: selectedLevel == level ? kWhiteThemeColor : kAppThemeColor,
        ),
      ),
    );
  }
}

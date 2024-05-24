import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';

/// Screen to update the user's weekly goal
class UpdateWeeklyGoalScreen extends StatefulWidget {
  const UpdateWeeklyGoalScreen({
    super.key,
    required this.userWeeklyGoal,
    required this.loggedInUser,
  });

  final int userWeeklyGoal;
  final User loggedInUser;

  @override
  State<UpdateWeeklyGoalScreen> createState() => _UpdateWeeklyGoalScreenState();
}

class _UpdateWeeklyGoalScreenState extends State<UpdateWeeklyGoalScreen> {
  // Declare a variable to store the user's main goal
  late int _updatedUserWeeklyGoal;

  /// Update weekly goal
  Future<void> updateWeeklyGoal(int updatedWeeklyGoal) async {
    try {
      // Get a reference to the document
      DocumentReference documentRef = FirebaseFirestore.instance
          .collection('users')
          .doc(widget.loggedInUser.email);

      // Update the main goal
      await documentRef.update({
        'weeklyGoal': updatedWeeklyGoal,
        'finishedDaysOfCurrentWorkoutPlan': 0,
      });

      print('Document updated successfully.');
    } catch (e) {
      print('Error updating document: $e');
    }
  }

  @override
  void initState() {
    _updatedUserWeeklyGoal = widget.userWeeklyGoal;
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
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding16,
              ),
              child: InitialScreensTitleAndDescriptionHolder(
                title: 'Set your weekly goal',
                description:
                    'How many days per week can you dedicate to one workout plan?',
              ),
            ),

            /// Middle of the screen
            /// Week days buttons holder
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(
                  top: kPadding16,
                  bottom: kPadding16,
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                primary: false,
                children: [
                  /// 1 day a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 1;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 1,
                    title: '1 Day',
                    description: 'Dedicate 1 day a week',
                  ),

                  /// 2 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 2;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 2,
                    title: '2 Days',
                    description: 'Dedicate 2 days a week',
                  ),

                  /// 3 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 3;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 3,
                    title: '3 Days',
                    description: 'Dedicate 3 days a week',
                  ),

                  /// 4 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 4;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 4,
                    title: '4 Days',
                    description: 'Dedicate 4 days a week',
                  ),

                  /// 5 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 5;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 5,
                    title: '5 Days',
                    description: 'Dedicate 5 days a week',
                  ),

                  /// 6 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 6;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 6,
                    title: '6 Days',
                    description: 'Dedicate 6 days a week',
                  ),

                  /// 7 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _updatedUserWeeklyGoal = 7;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _updatedUserWeeklyGoal,
                    selectedDays: 7,
                    title: '7 Days',
                    description: 'Dedicate 7 days a week',
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
                  updateWeeklyGoal(_updatedUserWeeklyGoal);
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

/// Button to select how many days the user can dedicate to the workout plan
class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.userSelectedDays,
    required this.selectedDays,
    required this.onPressed,
    required this.title,
    required this.description,
  });

  final int userSelectedDays;
  final int selectedDays;
  final String title;
  final String description;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kDayButtonStyle.copyWith(
        backgroundColor: userSelectedDays == selectedDays
            ? const WidgetStatePropertyAll(kAppThemeColor)
            : const WidgetStatePropertyAll(kWhiteThemeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kDayButtonTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kWhiteThemeColor
                  : kAppThemeColor,
            ),
          ),
          Text(
            description,
            style: kSmallGreyColorDescriptionTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kGreyThemeColor02
                  : kGreyThemeColor,
              fontWeight: FontWeight.w700,
            ),
          ),
        ],
      ),
    );
  }
}

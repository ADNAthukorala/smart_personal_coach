import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/weekly_goal_screen.dart';

/// Screen to get the user's pull ups capacity
class CheckingPullUpsCapacity extends StatefulWidget {
  const CheckingPullUpsCapacity({super.key});

  @override
  State<CheckingPullUpsCapacity> createState() =>
      _CheckingPullUpsCapacityState();
}

class _CheckingPullUpsCapacityState extends State<CheckingPullUpsCapacity> {
  /// Declare a Capacity variable to store user's pull ups capacity
  Capacity _userPullUpsCapacity = Capacity.beginner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 6,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'How many pull-ups can you do at one time?',
                description: '',
              ),
            ),

            /// Middle of the screen
            /// Capacity buttons holder
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                children: [
                  /// Add space
                  const SizedBox(height: 12.0),

                  /// Beginner button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPullUpsCapacity = Capacity.beginner;
                      });
                      print(_userPullUpsCapacity);
                    },
                    actualCapacity: _userPullUpsCapacity,
                    selectedCapacity: Capacity.beginner,
                    title: 'Beginner',
                    description: '0 - 5  Pull-ups',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Intermediate button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPullUpsCapacity = Capacity.intermediate;
                      });
                      print(_userPullUpsCapacity);
                    },
                    actualCapacity: _userPullUpsCapacity,
                    selectedCapacity: Capacity.intermediate,
                    title: 'Intermediate',
                    description: '6 - 10  Pull-ups',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Advanced button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPullUpsCapacity = Capacity.advanced;
                      });
                      print(_userPullUpsCapacity);
                    },
                    actualCapacity: _userPullUpsCapacity,
                    selectedCapacity: Capacity.advanced,
                    title: 'Advanced',
                    description: 'More than 10  Pull-ups',
                  ),

                  /// Add space
                  const SizedBox(height: 12.0),
                ],
              ),
            ),
            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
              ),
              child: NextButton(
                onPressed: () {
                  // When the button is clicked, navigate to the weekly goal screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const WeeklyGoalScreen(),
                    ),
                  );
                },
                style: kNextButtonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

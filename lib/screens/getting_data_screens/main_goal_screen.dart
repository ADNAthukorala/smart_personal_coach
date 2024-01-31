import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/checking_pushups_capacity.dart';

/// Create an enum named main goals
enum MainGoal { loseWeight, buildMuscles, keepFit }

/// Screen to get the user's main goal
class MainGoalScreen extends StatefulWidget {
  const MainGoalScreen({super.key});

  @override
  State<MainGoalScreen> createState() => _MainGoalScreenState();
}

class _MainGoalScreenState extends State<MainGoalScreen> {
  /// Declare a variable to store the user's main goal
  MainGoal _userMainGoal = MainGoal.loseWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 4,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.all(kPadding16),

        /// The main column of the screen
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'What are your main goals?',
                description: 'Why do you use this application?',
              ),
            ),

            /// Middle of the screen
            /// Buttons holder
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                primary: false,
                children: [
                  /// Add space
                  const SizedBox(height: 12.0),

                  /// Lose weight button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to lose weight.
                        _userMainGoal = MainGoal.loseWeight;
                      });
                      print(_userMainGoal);
                    },
                    userMainGoal: _userMainGoal,
                    selectedMainGoal: MainGoal.loseWeight,
                    buttonLabel: 'Lose Weight',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Build muscles button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to build muscles.
                        _userMainGoal = MainGoal.buildMuscles;
                      });
                      print(_userMainGoal);
                    },
                    userMainGoal: _userMainGoal,
                    selectedMainGoal: MainGoal.buildMuscles,
                    buttonLabel: 'Build Muscles',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Keep fit button
                  SelectMainGoalButton(
                    onPressed: () {
                      setState(() {
                        // If the button is clicked, the user's main goal should be to keep fit.
                        _userMainGoal = MainGoal.keepFit;
                      });
                      print(_userMainGoal);
                    },
                    userMainGoal: _userMainGoal,
                    selectedMainGoal: MainGoal.keepFit,
                    buttonLabel: 'Keep Fit',
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
                  // When the button is clicked, navigate to the checking push ups capacity screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckingPushUpsCapacity(),
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

/// Create a button to select the user's main goal
class SelectMainGoalButton extends StatelessWidget {
  const SelectMainGoalButton({
    super.key,
    required this.userMainGoal,
    required this.selectedMainGoal,
    this.onPressed,
    required this.buttonLabel,
  });

  final MainGoal userMainGoal;
  final MainGoal selectedMainGoal;
  final void Function()? onPressed;
  final String buttonLabel;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectCapacityButtonStyle.copyWith(
        // If the selected main goal is equal to the user's main goal, the button color should be blue, otherwise white
        backgroundColor: selectedMainGoal == userMainGoal
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectCapacityButtonTextStyle.copyWith(
          // If the selected main goal is equal to the user's main goal, the button text color should be white, otherwise blue
          color: selectedMainGoal == userMainGoal
              ? kWhiteThemeColor
              : kBlueThemeColor,
        ),
      ),
    );
  }
}

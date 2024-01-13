import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/checking_pushups_capacity.dart';

/// Create an enum named main goals
enum MainGoal { loseWeight, buildMuscles, keepFit }

/// Screen to get the user's main goal
class MainGoalScreen extends StatefulWidget {
  const MainGoalScreen({super.key});

  @override
  State<MainGoalScreen> createState() => _MainGoalScreenState();
}

class _MainGoalScreenState extends State<MainGoalScreen> {
  /// Declare a variable to store user's main goal
  MainGoal userMainGoal = MainGoal.loseWeight;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
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
              ],
            ),
          )),

      /// Body of the screen
      body: Padding(
        /// Add padding around the body
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            /// The title and the description of the screen
            const TitleAndDescriptionHolder(
              title: 'What are your main goals?',
              description: 'Why do you use this application?',
            ),
            const Spacer(),
            Column(
              /// Buttons holder
              children: [
                /// Lose weight button
                SelectMainGoalButton(
                  onPressed: () {
                    setState(() {
                      // If the button is clicked, the user's main goal should be to lose weight.
                      userMainGoal = MainGoal.loseWeight;
                    });
                    print(userMainGoal);
                  },
                  userMainGoal: userMainGoal,
                  selectedMainGoal: MainGoal.loseWeight,
                  buttonLabel: 'Lose Weight',
                ),

                /// Add space between lose weight and build muscles buttons
                const SizedBox(height: 20.0),

                /// Build muscles button
                SelectMainGoalButton(
                  onPressed: () {
                    setState(() {
                      // If the button is clicked, the user's main goal should be to build muscles.
                      userMainGoal = MainGoal.buildMuscles;
                    });
                    print(userMainGoal);
                  },
                  userMainGoal: userMainGoal,
                  selectedMainGoal: MainGoal.buildMuscles,
                  buttonLabel: 'Build Muscles',
                ),

                /// Add space between build muscles and keep fit buttons
                const SizedBox(height: 20.0),

                /// Keep fit button
                SelectMainGoalButton(
                  onPressed: () {
                    setState(() {
                      // If the button is clicked, the user's main goal should be to keep fit.
                      userMainGoal = MainGoal.keepFit;
                    });
                    print(userMainGoal);
                  },
                  userMainGoal: userMainGoal,
                  selectedMainGoal: MainGoal.keepFit,
                  buttonLabel: 'Keep Fit',
                ),
              ],
            ),
            const Spacer(flex: 4),

            /// Button to go to the next screen
            NextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckingPushUpsCapacity(),
                  ),
                );
              },
              style: kNextButtonStyle,
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

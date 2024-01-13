import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/weekly_goal_screen.dart';

class CheckingPullUpsCapacity extends StatefulWidget {
  const CheckingPullUpsCapacity({super.key});

  @override
  State<CheckingPullUpsCapacity> createState() =>
      _CheckingPullUpsCapacityState();
}

class _CheckingPullUpsCapacityState extends State<CheckingPullUpsCapacity> {
  // Declare a Capacity variable to store user's pull ups capacity
  Capacity pullUpsCapacity = Capacity.beginner;

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
              ],
            ),
          )),
      body: Padding(
        // Add padding around the main column
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            // Title and description
            const TitleAndDescriptionHolder(
              title: 'How many pull-ups can you do at one time?',
              description: '',
            ),
            const Spacer(),
            // Capacity button holder
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SelectCapacityButton(
                  onPressed: () {
                    setState(() {
                      pullUpsCapacity = Capacity.beginner;
                    });
                    print(pullUpsCapacity);
                  },
                  actualCapacity: pullUpsCapacity,
                  buttonCapacity: Capacity.beginner,
                  buttonTitle: 'Beginner',
                  buttonDescription: '0 - 5  Pull-ups',
                ),
                // Add space between 1st and 2nd button
                const SizedBox(height: 20.0),
                SelectCapacityButton(
                  onPressed: () {
                    setState(() {
                      pullUpsCapacity = Capacity.intermediate;
                    });
                    print(pullUpsCapacity);
                  },
                  actualCapacity: pullUpsCapacity,
                  buttonCapacity: Capacity.intermediate,
                  buttonTitle: 'Intermediate',
                  buttonDescription: '6 - 10  Pull-ups',
                ),
                // Add space between 2nd and 3rd button
                const SizedBox(height: 20.0),
                SelectCapacityButton(
                  onPressed: () {
                    setState(() {
                      pullUpsCapacity = Capacity.advanced;
                    });
                    print(pullUpsCapacity);
                  },
                  actualCapacity: pullUpsCapacity,
                  buttonCapacity: Capacity.advanced,
                  buttonTitle: 'Advanced',
                  buttonDescription: 'More than 10  Pull-ups',
                ),
              ],
            ),
            const Spacer(flex: 4),
            // Next button
            NextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WeeklyGoalScreen(),
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

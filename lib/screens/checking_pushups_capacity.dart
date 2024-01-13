import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/checking_pullups_capacity.dart';

class CheckingPushUpsCapacity extends StatefulWidget {
  const CheckingPushUpsCapacity({super.key});

  @override
  State<CheckingPushUpsCapacity> createState() =>
      _CheckingPushUpsCapacityState();
}

class _CheckingPushUpsCapacityState extends State<CheckingPushUpsCapacity> {
  // Declare a Capacity variable to store user's push ups capacity
  Capacity pushUpsCapacity = Capacity.beginner;

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
              title: 'How many push-ups can you do at one time?',
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
                      pushUpsCapacity = Capacity.beginner;
                    });
                    print(pushUpsCapacity);
                  },
                  actualCapacity: pushUpsCapacity,
                  buttonCapacity: Capacity.beginner,
                  title: 'Beginner',
                  description: '0 - 5  Push-ups',
                ),
                // Add space between 1st and 2nd button
                const SizedBox(height: 20.0),
                SelectCapacityButton(
                  onPressed: () {
                    setState(() {
                      pushUpsCapacity = Capacity.intermediate;
                    });
                    print(pushUpsCapacity);
                  },
                  actualCapacity: pushUpsCapacity,
                  buttonCapacity: Capacity.intermediate,
                  title: 'Intermediate',
                  description: '6 - 10  Push-ups',
                ),
                // Add space between 2nd and 3rd button
                const SizedBox(height: 20.0),
                SelectCapacityButton(
                  onPressed: () {
                    setState(() {
                      pushUpsCapacity = Capacity.advanced;
                    });
                    print(pushUpsCapacity);
                  },
                  actualCapacity: pushUpsCapacity,
                  buttonCapacity: Capacity.advanced,
                  title: 'Advanced',
                  description: 'More than 10  Push-ups',
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
                    builder: (context) => const CheckingPullUpsCapacity(),
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

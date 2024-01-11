import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
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
      appBar: AppBar(),
      body: Padding(
        // Add padding around the main column
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            // Topic
            const Text(
              'How many push-ups can you do at once?',
              style: kLargeBlackTopicTextStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
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
                  buttonLabel: '0 - 5  Push-ups',
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
                  buttonLabel: '6 - 10  Push-ups',
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
                  buttonLabel: 'More than 10  Push-ups',
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

import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/screens/checking_volume_screen_02.dart';

class CheckingVolumeScreen01 extends StatefulWidget {
  const CheckingVolumeScreen01({super.key});

  @override
  State<CheckingVolumeScreen01> createState() => _CheckingVolumeScreen01State();
}

class _CheckingVolumeScreen01State extends State<CheckingVolumeScreen01> {
  Capacity pushUpsCapacity = Capacity.beginner;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        // Add padding around the main column
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Topic
            const Text(
              'How many push-ups can you do at once?',
              style: kLargeTextStyle,
              textAlign: TextAlign.center,
            ),
            const Spacer(),
            Column(
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
                const SizedBox(height: 16.0),
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
                const SizedBox(height: 16.0),
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
                    builder: (context) => const CheckingVolumeScreen02(),
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


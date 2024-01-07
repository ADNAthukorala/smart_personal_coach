import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/screens/checking_volume_screen_02.dart';

class CheckingVolumeScreen01 extends StatefulWidget {
  const CheckingVolumeScreen01({super.key});

  @override
  State<CheckingVolumeScreen01> createState() => _CheckingVolumeScreen01State();
}

class _CheckingVolumeScreen01State extends State<CheckingVolumeScreen01> {
  String pushUpsVolume = '0-5';

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
                SelectVolumeButton(
                  onPressed: () {
                    setState(() {
                      pushUpsVolume = '0-5';
                    });
                  },
                  volume: pushUpsVolume,
                  selectedVolume: '0-5',
                  buttonLabel: '0 - 5  Push-ups',
                ),
                const SizedBox(height: 16.0),
                SelectVolumeButton(
                  onPressed: () {
                    setState(() {
                      pushUpsVolume = '6-10';
                    });
                  },
                  volume: pushUpsVolume,
                  selectedVolume: '6-10',
                  buttonLabel: '6 - 10  Push-ups',
                ),
                const SizedBox(height: 16.0),
                SelectVolumeButton(
                  onPressed: () {
                    setState(() {
                      pushUpsVolume = 'more than 10';
                    });
                  },
                  volume: pushUpsVolume,
                  selectedVolume: 'more than 10',
                  buttonLabel: 'More than 10  Push-ups',
                ),
              ],
            ),
            const Spacer(flex: 4),
            //Next button
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const CheckingVolumeScreen02(),
                  ),
                );
              },
              style: kNextButtonStyle,
              child: const Text(
                'Next',
                style: kNextButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SelectVolumeButton extends StatelessWidget {
  const SelectVolumeButton({
    super.key,
    required this.volume,
    required this.selectedVolume,
    required this.buttonLabel,
    required this.onPressed,
  });

  final String volume;
  final String selectedVolume;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectVolumeButtonStyle.copyWith(
        backgroundColor: volume == selectedVolume
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectVolumeButtonTextStyle.copyWith(
          color: volume == selectedVolume ? kWhiteThemeColor : kBlueThemeColor,
        ),
      ),
    );
  }
}

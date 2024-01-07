import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class CheckingVolumeScreen01 extends StatefulWidget {
  const CheckingVolumeScreen01({super.key});

  @override
  State<CheckingVolumeScreen01> createState() => _CheckingVolumeScreen01State();
}

class _CheckingVolumeScreen01State extends State<CheckingVolumeScreen01> {
  String pushUpsVolume = ' ';

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
            Column(
              children: [
                SelectVolumeButton(pushUpsVolume: pushUpsVolume),
              ],
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
    required this.pushUpsVolume,
  });

  final String pushUpsVolume;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: kSelectVolumeButtonStyle.copyWith(
        backgroundColor: pushUpsVolume == '0-5'
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        '0 - 5  Push-ups',
        style: kSelectVolumeButtonTextStyle.copyWith(
          color: pushUpsVolume == '0-5'
              ? kWhiteThemeColor
              : kBlueThemeColor,
        ),
      ),
    );
  }
}


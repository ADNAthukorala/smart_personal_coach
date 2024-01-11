import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

/// Enum for capacity
enum Capacity { beginner, intermediate, advanced }

/// Select Capacity Button
class SelectCapacityButton extends StatelessWidget {
  const SelectCapacityButton({
    super.key,
    required this.actualCapacity,
    required this.buttonCapacity,
    required this.buttonLabel,
    required this.onPressed,
  });

  final Capacity actualCapacity; // Declare a variable to store the actual capacity
  final Capacity buttonCapacity; // Declare a variable to store the button capacity
  final String buttonLabel; // Declare variable to hold the button label
  final void Function()? onPressed; // Function to trigger when button is clicked

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectVolumeButtonStyle.copyWith(
        // If the actual capacity is equal to button capacity, the button color should be blue, otherwise white
        backgroundColor: actualCapacity == buttonCapacity
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectVolumeButtonTextStyle.copyWith(
          // If the actual capacity is equal to button capacity, the button text color should be white, otherwise blue
          color: actualCapacity == buttonCapacity ? kWhiteThemeColor : kBlueThemeColor,
        ),
      ),
    );
  }
}

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
    required this.buttonTitle,
    required this.buttonDescription,
    required this.onPressed,
  });

  final Capacity actualCapacity; // Declare a variable to store the actual capacity
  final Capacity buttonCapacity; // Declare a variable to store the button capacity
  final String buttonTitle; // Declare variable to hold the button label
  final String buttonDescription;
  final void Function()? onPressed; // Function to trigger when button is clicked

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectCapacityButtonStyle.copyWith(
        // If the actual capacity is equal to button capacity, the button color should be blue, otherwise white
        backgroundColor: actualCapacity == buttonCapacity
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            buttonTitle,
            style: kSelectCapacityButtonTextStyle.copyWith(
              // If the actual capacity is equal to button capacity, the button text color should be white, otherwise blue
              color: actualCapacity == buttonCapacity ? kWhiteThemeColor : kBlueThemeColor,
            ),
          ),
          Text(
            buttonDescription,
            style: kSelectCapacityButtonTextStyle.copyWith(
              // If the actual capacity is equal to button capacity, the button text color should be white, otherwise blue
              color: actualCapacity == buttonCapacity ? kGreyThemeColor02 : kGreyThemeColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

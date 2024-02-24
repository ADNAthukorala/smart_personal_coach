import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

/// Enum for capacity
enum Capacity { beginner, intermediate, advanced }

/// Select Capacity Button
class SelectCapacityButton extends StatelessWidget {
  const SelectCapacityButton({
    super.key,
    required this.actualCapacity,
    required this.selectedCapacity,
    required this.title,
    required this.description,
    required this.onPressed,
  });

  final Capacity
      actualCapacity; // Declare a variable to store the actual capacity
  final Capacity
      selectedCapacity; // Declare a variable to store the button capacity
  final String title; // Declare variable to hold the button label
  final String description;
  final void Function()?
      onPressed; // Function to trigger when button is clicked

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectCapacityButtonStyle.copyWith(
        // If the actual capacity is equal to button capacity, the button color should be blue, otherwise white
        backgroundColor: actualCapacity == selectedCapacity
            ? const MaterialStatePropertyAll(kThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: kSelectCapacityButtonTextStyle.copyWith(
              // If the actual capacity is equal to button capacity, the button text color should be white, otherwise blue
              color: actualCapacity == selectedCapacity
                  ? kWhiteThemeColor
                  : kThemeColor,
            ),
          ),
          Text(
            description,
            style: kSelectCapacityButtonTextStyle.copyWith(
              // If the actual capacity is equal to button capacity, the button text color should be white, otherwise blue
              color: actualCapacity == selectedCapacity
                  ? kGreyThemeColor02
                  : kGreyThemeColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

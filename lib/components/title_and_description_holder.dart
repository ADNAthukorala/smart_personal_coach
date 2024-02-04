import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

/// Title and description holder
class TitleAndDescriptionHolder extends StatelessWidget {
  const TitleAndDescriptionHolder({
    super.key,
    required this.title,
    required this.description,
  });

  final String title;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: kLargeBlackTitleTextStyle,
          textAlign: TextAlign.center,
        ),
        description == ''
            ? const SizedBox(height: 0)
            : Text(
          description,
          style: kSmallGreyColorDescriptionTextStyle,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
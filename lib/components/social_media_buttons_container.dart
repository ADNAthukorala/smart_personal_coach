import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

//Social media buttons container
class SocialMediaButtonsContainer extends StatelessWidget {
  const SocialMediaButtonsContainer(
      {super.key,
        required this.onPressedGoogle,
        required this.onPressedFacebook});

  final void Function()? onPressedGoogle;
  final void Function()? onPressedFacebook;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text(
          "Or continue with",
          style: kSmallGreyColorMessageTextStyle,
          textAlign: TextAlign.center,
        ),
        //Icon buttons row
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //Google icon button
            IconButton(
              onPressed: onPressedGoogle,
              icon: Image.asset(
                'images/google_icon.png',
              ),
            ),
            //Facebook icon button
            IconButton(
              onPressed: onPressedFacebook,
              icon: Image.asset(
                'images/facebook_icon.png',
              ),
            ),
          ],
        ),
      ],
    );
  }
}
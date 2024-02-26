import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

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
        const Row(
          children: [
            Expanded(
              child: Divider(
                color: kGreyThemeColor,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                left: kPadding12,
                right: kPadding12,
              ),
              child: Text(
                "Or continue with",
                style: kSmallGreyColorDescriptionTextStyle,
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Divider(
                color: kGreyThemeColor,
              ),
            ),
          ],
        ),

        /// Add space
        const SizedBox(
          height: 12.0,
        ),

        /// Icon buttons holder
        Column(
          children: [
            /// Google icon button
            TextButton.icon(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                    Size.fromWidth(double.maxFinite)),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: kGreyThemeColor02)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kRadius16))),
              ),
              onPressed: onPressedGoogle,
              icon: Image.asset(
                'images/google-logo.png',
                height: 30.0,
                width: 30.0,
              ),
              label: const Text(
                'Sign in with Google',
                style: TextStyle(
                  color: kBlackThemeColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Add space
            const SizedBox(
              height: 12.0,
            ),

            /// Facebook icon button
            TextButton.icon(
              style: ButtonStyle(
                fixedSize: const MaterialStatePropertyAll(
                    Size.fromWidth(double.maxFinite)),
                side: const MaterialStatePropertyAll(
                    BorderSide(color: kGreyThemeColor02)),
                shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(kRadius16))),
              ),
              onPressed: onPressedGoogle,
              icon: Image.asset(
                'images/facebook-logo.png',
                height: 30.0,
                width: 30.0,
              ),
              label: const Text(
                'Sign in with Facebook',
                style: TextStyle(
                  color: kBlackThemeColor,
                  fontSize: 14.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

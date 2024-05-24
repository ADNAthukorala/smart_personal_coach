import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

/// About us
class AboutUsScreen extends StatefulWidget {
  const AboutUsScreen({super.key});

  @override
  State<AboutUsScreen> createState() => _AboutUsScreenState();
}

class _AboutUsScreenState extends State<AboutUsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Usss',
          style: kAppBarTextStyle,
        ),
        iconTheme: const IconThemeData(color: kWhiteThemeColor),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body content
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            Expanded(
              child: Center(
                child: ListView(
                  // Include all components in a list view and set padding around the components to 0
                  padding: const EdgeInsets.only(
                    top: kPadding16,
                    bottom: kPadding16,
                  ),
                  primary: false,
                  shrinkWrap: true,
                  children: const [
                    Column(
                      children: [
                        Text(
                          'ADNA DEVELOPERS',
                          style: kLargeBlackTitleTextStyle,
                        ),
                        Image(image: AssetImage("images/adna-logo.png")),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            /// Adding space
            const SizedBox(height: 8.0),

            /// Go-back button
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: kNextButtonStyle,
              child: const Text(
                'Back',
                style: kNextButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

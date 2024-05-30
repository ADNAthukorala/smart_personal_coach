import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:url_launcher/url_launcher.dart';

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
      backgroundColor: kBlackThemeColor,

      /// Appbar
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'About Us',
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
                  children: [
                    Column(
                      children: [
                        /// Logo
                        const Image(
                          image: AssetImage("images/adna-logo-txt.png"),
                          width: 100,
                        ),

                        /// Add space
                        const SizedBox(height: 8.0),

                        /// Email
                        const Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.email_rounded, color: kGreyThemeColor),
                            SizedBox(width: 8.0),
                            Text(
                              'adna8info@gmail.com',
                              style: kSmallGreyColorDescriptionTextStyle,
                            ),
                          ],
                        ),

                        /// Youtube video
                        TextButton.icon(
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://youtu.be/vVRBm0yh_Us?si=PKV5Sj3K5SIQb2ir');

                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          label: const Text(
                            'Watch on youtube',
                            style: kSmallGreyColorDescriptionTextStyle,
                          ),
                          icon: const Icon(
                            Icons.play_circle_filled_rounded,
                            color: kGreyThemeColor,
                          ),
                        ),
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

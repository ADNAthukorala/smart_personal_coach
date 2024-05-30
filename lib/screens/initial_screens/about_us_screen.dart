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
                            Icon(Icons.email_rounded, color: kWhiteThemeColor),
                            SizedBox(width: 8.0),
                            Text(
                              'adna8info@gmail.com',
                              style: TextStyle(
                                color: kWhiteThemeColor,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),

                        /// Youtube video
                        ElevatedButton.icon(
                          style: ElevatedButton.styleFrom(
                              backgroundColor: kRedThemeColor),
                          onPressed: () async {
                            final Uri url = Uri.parse(
                                'https://www.youtube.com/channel/UCMc_eDDgirfAQYpWj681WvA');

                            if (!await launchUrl(url)) {
                              throw Exception('Could not launch $url');
                            }
                          },
                          label: const Text(
                            'Watch on YouTube',
                            style: TextStyle(
                              color: kWhiteThemeColor,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          icon: const Icon(
                            Icons.play_arrow_rounded,
                            color: kWhiteThemeColor,
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

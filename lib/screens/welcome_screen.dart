import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/top_image.dart';
import 'package:smart_personal_coach/screens/signin_screen.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Flexible(
            flex: 5,
            child: TopImage(imageUrl: 'images/welcome_screen_image.jpg'),
          ),
          Flexible(
            flex: 3,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(kPadding16, kPadding8, kPadding16, kPadding16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Welcome',
                        style: kWelcomeTextStyle,
                      ),
                      Text(
                        'Smart Personal Coach',
                        style: kWelcomeTextStyle,
                      ),
                    ],
                  ),
                  const Text(
                    "Welcome to Smart Personal Coach! Join us on your journey to wellness. "
                    "Set goals, sweat it out, and conquer each day. Let's achieve greatness together!",
                    style: kSmallGreyColorDescriptionTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    style: kWelcomeButtonStyle,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignInScreen(),
                        ),
                      );
                    },
                    child: const Text(
                      'Get Started',
                      style: kWelcomeButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

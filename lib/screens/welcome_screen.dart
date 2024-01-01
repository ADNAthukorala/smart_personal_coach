import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

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
          Flexible(
            flex: 5,
            child: Container(
              decoration: kImageContainerDecoration,
            ),
          ),
          Flexible(
            flex: 3,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                  style: kWelcomeMessageTextStyle,
                  textAlign: TextAlign.center,
                ),
                ElevatedButton(
                  style: kWelcomeButtonStyle,
                  onPressed: () {},
                  child: const Text(
                    'Get Started',
                    style: kWelcomeButtonTextStyle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

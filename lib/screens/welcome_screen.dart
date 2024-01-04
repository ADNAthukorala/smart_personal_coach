import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components.dart';
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
                  style: kSmallTextStyle,
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
        ],
      ),
    );
  }
}

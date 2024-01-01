import 'package:flutter/material.dart';

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
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/welcome_screen_image.jpg'),
                  fit: BoxFit.fill,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Column(
                    children: [
                      Text(
                        'Welcome',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                      Text(
                        'Smart Personal Coach',
                        style: TextStyle(
                          fontFamily: "Inter",
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: Color(0xff000000),
                        ),
                      ),
                    ],
                  ),
                  const Text(
                    "Welcome to Smart Personal Coach! Join us on your journey to wellness. "
                    "Set goals, sweat it out, and conquer each day. Let's achieve greatness together!",
                    style: TextStyle(
                      fontFamily: "Inter",
                      fontSize: 12,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7e7474),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  ElevatedButton(
                    style: const ButtonStyle(
                      fixedSize: MaterialStatePropertyAll(Size(200, 70)),
                      backgroundColor:
                          MaterialStatePropertyAll(Color(0xFF4594DD)),
                      shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(8),
                            bottomRight: Radius.circular(16),
                            bottomLeft: Radius.circular(8)),
                      )),
                    ),
                    onPressed: () {},
                    child: const Text(
                      'Getting Started',
                      style: TextStyle(
                        fontFamily: "Inter",
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFFFFFFFF),
                      ),
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

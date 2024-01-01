import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Flexible(
            child: Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('images/login_screen_image.jpg'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(50.0),
                ),
              ),
            ),
          ),
          Flexible(
            child: Container(
              padding: const EdgeInsets.all(16.0),
              child: const Column(
                children: [
                  Text(
                    'Sign In',
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 28,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff000000),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Please enter email and password for login',
                    style: const TextStyle(
                      fontFamily: "Inter",
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Color(0xff7e7474),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 22.0,
                  ),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'Email'
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

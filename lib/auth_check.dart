import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/screens/initial_screens/bottom_navigationbar_screen.dart';
import 'package:smart_personal_coach/screens/initial_screens/welcome_screen.dart';

class AuthCheck extends StatelessWidget {
  const AuthCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const CircularProgressIndicator();
        } else if (snapshot.hasData) {
          return const BottomNavigationBarScreen(); // User is signed in
        } else {
          return const WelcomeScreen(); // User is not signed in
        }
      },
    );
  }
}

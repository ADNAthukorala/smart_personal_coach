import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/data_gathering_screens/gender_selection_screen.dart';
import 'package:smart_personal_coach/screens/initial_screens/bottom_navigationbar_screen.dart';
import 'package:smart_personal_coach/screens/initial_screens/welcome_screen.dart';

class AuthCheckTry extends StatelessWidget {
  const AuthCheckTry({super.key});

  Future<String> isSigned() async {
    if (FirebaseAuth.instance.currentUser != null) {
      // User is signed in
      DocumentSnapshot docSnapshot = await FirebaseFirestore.instance
          .collection('users')
          .doc(FirebaseAuth.instance.currentUser!.email)
          .get();
      if (docSnapshot.exists) {
        print('BottomNavigationBarScreen'); // ignore: avoid_print
        return 'BottomNavigationBarScreen';
      } else {
        print('GenderSelectionScreen'); // ignore: avoid_print
        return 'GenderSelectionScreen';
      }
    } else {
      // User isn't signed in
      print('WelcomeScreen'); // ignore: avoid_print
      return 'WelcomeScreen';
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: isSigned(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
              child: CircularProgressIndicator(
            color: kAppThemeColor,
          ));
        } else if (snapshot.hasError) {
          return const WelcomeScreen();
        } else if (snapshot.data == 'BottomNavigationBarScreen') {
          return const BottomNavigationBarScreen();
        } else if (snapshot.data == 'GenderSelectionScreen') {
          return const GenderSelectionScreen();
        } else {
          return const WelcomeScreen();
        }
      },
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/checking_pullups_capacity.dart';

/// Screen to get the user's push ups capacity
class CheckingPushUpsCapacity extends StatefulWidget {
  const CheckingPushUpsCapacity({super.key});

  @override
  State<CheckingPushUpsCapacity> createState() =>
      _CheckingPushUpsCapacityState();
}

class _CheckingPushUpsCapacityState extends State<CheckingPushUpsCapacity> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Declare a Capacity variable to store user's push ups capacity
  Capacity _userPushUpsCapacity = Capacity.beginner;

  /// Adding data to the database (User push-ups capacity)
  void addData() {
    _firestore.collection("users").doc(loggedInUser.email).set({
      'push_ups_capacity': _userPushUpsCapacity.toString(),
    }, SetOptions(merge: true)).onError(
        (error, stackTrace) => print("Error: $error"));
  }

  /// Creating a method to get the logged in user
  void getLoggedIntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      // Show snack bar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error has occurred!')),
      );
    }
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        backgroundColor: kWhiteThemeColor,
        scrolledUnderElevation: 0,
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 5,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
          bottom: kPadding16,
        ),
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'How many push-ups can you do at one time?',
                description: '',
              ),
            ),

            /// Middle of the screen
            /// Capacity buttons holder
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: kPadding8,
                  bottom: kPadding8,
                ),
                primary: false,
                children: [
                  /// Beginner button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPushUpsCapacity = Capacity.beginner;
                      });
                      print(_userPushUpsCapacity);
                    },
                    actualCapacity: _userPushUpsCapacity,
                    selectedCapacity: Capacity.beginner,
                    title: 'Beginner',
                    description: '0 - 5  Push-ups',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Intermediate button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPushUpsCapacity = Capacity.intermediate;
                      });
                      print(_userPushUpsCapacity);
                    },
                    actualCapacity: _userPushUpsCapacity,
                    selectedCapacity: Capacity.intermediate,
                    title: 'Intermediate',
                    description: '6 - 10  Push-ups',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Advanced button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPushUpsCapacity = Capacity.advanced;
                      });
                      print(_userPushUpsCapacity);
                    },
                    actualCapacity: _userPushUpsCapacity,
                    selectedCapacity: Capacity.advanced,
                    title: 'Advanced',
                    description: 'More than 10  Push-ups',
                  ),
                ],
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding8,
              ),
              child: NextButton(
                onPressed: () {
                  // Calling the addData method to add data to the database
                  addData();
                  // When the button is clicked, navigate to the checking pull ups capacity screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CheckingPullUpsCapacity(),
                    ),
                  );
                },
                style: kNextButtonStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

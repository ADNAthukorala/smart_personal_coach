import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/reusable_card_with_slider.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/body_areas_selection_screen.dart';

/// Screen to get the user age, height, weight
class BirthDayHeightWeightScreen extends StatefulWidget {
  const BirthDayHeightWeightScreen({super.key});

  @override
  State<BirthDayHeightWeightScreen> createState() => _BirthDayHeightWeightScreenState();
}

class _BirthDayHeightWeightScreenState extends State<BirthDayHeightWeightScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Declare variables to store user age, height and weight and assign default values for them.
  int _userAge = 18;
  int _userHeight = 120;
  int _userWeight = 60;

  /// Adding data to the database (User age, height, weight)
  void addData() {
    _firestore.collection("users").doc(loggedInUser.email).set({
      'age': _userAge,
      'height': _userHeight,
      'weight': _userWeight
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
        centerTitle: true,

        /// Show which screen the user is on
        title: const AppBarTitle(
          screenId: 2,
        ),
      ),

      /// Body of the screen
      body: Padding(
        // Add padding around the body of the screen
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            /// Top of the screen
            /// The title and the description
            const Padding(
              padding: EdgeInsets.only(
                bottom: kPadding8,
              ),
              child: TitleAndDescriptionHolder(
                title: 'Let us known you better',
                description:
                    'Let us know you better to help boost your workout results',
              ),
            ),

            /// Middle of the screen
            /// Sliders holder (Age, Height, Weight)
            Expanded(
              child: ListView(
                padding: const EdgeInsets.only(
                  top: kPadding8,
                  bottom: kPadding8,
                ),
                primary: false,
                children: [
                  /// Get the user's age
                  ReusableCardWithSlider(
                    text1: 'Age',
                    text2: _userAge.toString(),
                    text3: 'years',
                    value: _userAge.toDouble(),
                    min: 2.0,
                    max: 200.0,
                    onChanged: (double newAge) {
                      setState(() {
                        _userAge = newAge.round();
                      });
                    },
                  ),

                  /// Add space between sliders
                  const SizedBox(height: 12.0),

                  /// Get the user's height
                  ReusableCardWithSlider(
                    text1: 'Height',
                    text2: _userHeight.toString(),
                    text3: 'cm',
                    value: _userHeight.toDouble(),
                    min: 60.0,
                    max: 280.0,
                    onChanged: (double newHeight) {
                      setState(() {
                        _userHeight = newHeight.round();
                      });
                    },
                  ),

                  /// Add space between sliders
                  const SizedBox(height: 12.0),

                  /// Get the user's weight
                  ReusableCardWithSlider(
                    text1: 'Weight',
                    text2: _userWeight.toString(),
                    text3: 'kg',
                    value: _userWeight.toDouble(),
                    min: 10.0,
                    max: 300.0,
                    onChanged: (double newWeight) {
                      setState(() {
                        _userWeight = newWeight.round();
                      });
                    },
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
                  // When the button is clicked, navigate to the body areas selection screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const BodyAreasSelectionScreen(),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/exercise_card.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/next_button.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/body_areas_selection_screen.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/checking_pullups_capacity.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/main_goal_screen.dart';

/// Screen to get the user's push ups capacity
class CheckingPushUpsCapacity extends StatefulWidget {
  const CheckingPushUpsCapacity(
      {super.key,
      required this.userGender,
      required this.userBirthDay,
      required this.userHeight,
      required this.userWeight,
      required this.userSelectedBodyAreas,
      required this.userMainGoal});

  final String userGender;
  final DateTime userBirthDay;
  final int userHeight;
  final int userWeight;
  final List<BodyArea> userSelectedBodyAreas;
  final MainGoal userMainGoal;

  @override
  State<CheckingPushUpsCapacity> createState() =>
      _CheckingPushUpsCapacityState();
}

class _CheckingPushUpsCapacityState extends State<CheckingPushUpsCapacity> {
  // Creating an instance of FirebaseAuth
  final _auth = FirebaseAuth.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Declare a Capacity variable to store user's push ups capacity
  Capacity _userPushUpsCapacity = Capacity.beginner;

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
        elevation: 0,
        shadowColor: kWhiteThemeColor,
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
                bottom: kPadding16,
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
                  top: kPadding16,
                  bottom: kPadding16,
                ),
                primary: false,
                children: [
                  /// Beginner button
                  SelectCapacityButton(
                    onPressed: () {
                      setState(() {
                        _userPushUpsCapacity = Capacity.beginner;
                      });
                      // print(_userPushUpsCapacity);
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
                      // print(_userPushUpsCapacity);
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
                      // print(_userPushUpsCapacity);
                    },
                    actualCapacity: _userPushUpsCapacity,
                    selectedCapacity: Capacity.advanced,
                    title: 'Advanced',
                    description: 'More than 10  Push-ups',
                  ),

                  /// Add space between buttons
                  const SizedBox(height: 20.0),

                  /// Button to show how to do push ups
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "What is push ups?",
                        style: TextStyle(
                          color: kAppThemeColor,
                          fontSize: 14.0,
                          fontWeight: FontWeight.w900,
                        ),
                      ),
                      const SizedBox(width: 5.0),
                      SizedBox(
                        height: 28,
                        width: 28,
                        child: IconButton.filled(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return const ExerciseCard(
                                  collectionName: "chest_exercises",
                                  documentName: "push_ups",
                                );
                              },
                            );
                          },
                          icon: const Icon(FontAwesomeIcons.exclamation),
                          iconSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            /// Bottom of the screen
            /// Next button
            Padding(
              padding: const EdgeInsets.only(
                top: kPadding16,
              ),
              child: NextButton(
                onPressed: () {
                  // When the button is clicked, navigate to the checking pull ups capacity screen
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => CheckingPullUpsCapacity(
                        userGender: widget.userGender,
                        userBirthDay: widget.userBirthDay,
                        userHeight: widget.userHeight,
                        userWeight: widget.userWeight,
                        userSelectedBodyAreas: widget.userSelectedBodyAreas,
                        userMainGoal: widget.userMainGoal,
                        userPushUpsCapacity: _userPushUpsCapacity,
                      ),
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

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
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

                  /// Button to show how to do push_ups
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Text(
                        "What is push ups?",
                        style: TextStyle(
                            color: kBlueThemeColor02,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w900),
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
                                return const Exercise(
                                  title: "Push Ups",
                                  animationImage: "https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fpush-ups%2Fanim-push-ups.gif?alt=media&token=e5ac39fb-b3a0-425e-abae-aee0bb4da085",
                                  description01: "Lay prone on the ground with arms supporting your body.",
                                  description02: "Keep your body straight while rising and lowering your body with your arms.",
                                  description03: "This exercise works the chest, shoulders, triceps, back and legs.",
                                  focusAreaImage: "https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fpush-ups%2Ffocus-push-ups.png?alt=media&token=4fe683c4-9f64-42dc-9375-7f02b115b1a6",
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
                top: kPadding8,
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

class Exercise extends StatelessWidget {
  const Exercise({
    super.key,
    required this.animationImage,
    required this.focusAreaImage,
    required this.title,
    required this.description01,
    required this.description02,
    required this.description03,
  });

  final String animationImage;
  final String focusAreaImage;
  final String title;
  final String description01;
  final String description02;
  final String description03;

  @override
  Widget build(BuildContext context) {
    return Card(
      surfaceTintColor: kWhiteThemeColor,
      color: kWhiteThemeColor,
      child: Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: ListView(
          primary: false,
          children: [
            /// Animation image
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: SizedBox(
                height: 250,
                child: Image.network(
                  animationImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            /// Title
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: TextStyle(
                  color: kBlueThemeColor02,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Divider line
            const Divider(),

            /// Description 01
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description01,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Description 02
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description02,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Description 03
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description03,
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Focus area (Title)
            const ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                "Focus Areas",
                style: TextStyle(
                  color: kBlueThemeColor02,
                  fontSize: 24.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            /// Focus areas (Image)
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: SizedBox(
                height: 280.0,
                child: Image.network(
                  focusAreaImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            /// Close button
            ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueThemeColor02),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Close",
                  style: TextStyle(
                    color: kWhiteThemeColor,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/app_bar_title.dart';
import 'package:smart_personal_coach/components/select_capacity_button.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components/title_and_description_holder.dart';
import 'package:smart_personal_coach/screens/bottom_navigationbar_screen.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/body_areas_selection_screen.dart';
import 'package:smart_personal_coach/screens/getting_data_screens/main_goal_screen.dart';

/// Screen to get data on how many days per week the user can dedicate to one workout plan
class WeeklyGoalScreen extends StatefulWidget {
  const WeeklyGoalScreen(
      {super.key,
      required this.userGender,
      required this.userBirthDay,
      required this.userHeight,
      required this.userWeight,
      required this.userSelectedBodyAreas,
      required this.userMainGoal,
      required this.userPushUpsCapacity,
      required this.userPullUpsCapacity});

  final String userGender;
  final DateTime userBirthDay;
  final int userHeight;
  final int userWeight;
  final List<BodyArea> userSelectedBodyAreas;
  final MainGoal userMainGoal;
  final Capacity userPushUpsCapacity;
  final Capacity userPullUpsCapacity;

  @override
  State<WeeklyGoalScreen> createState() => _WeeklyGoalScreenState();
}

class _WeeklyGoalScreenState extends State<WeeklyGoalScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Default profile picture url
  final String defaultProfilePicture =
      "https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/profile_pictures%2Fdefault_profile_picture.jpg?alt=media&token=0cddd010-118c-47ce-ba0a-fad1e54b479b";

  // Declare an int variable to store how many days the user can dedicate to the workout plan
  int _userSelectedDays = 1;

  /// Adding data to the database (User weekly goal)
  void _setData() async {
    _firestore.collection("users").doc(loggedInUser.email).set(
      {
        'gender': widget.userGender,
        'user_name': "user",
        'email': loggedInUser.email,
        'profile_picture': defaultProfilePicture,
        'birth_day': widget.userBirthDay,
        'height': widget.userHeight,
        'weight': widget.userWeight,
        'focus_body_areas': widget.userSelectedBodyAreas.map((e) => e.toString().split('.').last).toList(),
        'main_goal': widget.userMainGoal.toString().split('.').last,
        'push_ups_capacity': widget.userPushUpsCapacity.toString().split('.').last,
        'pull_ups_capacity': widget.userPullUpsCapacity.toString().split('.').last,
        'weekly_goal': _userSelectedDays,
      },
    ).onError((error, stackTrace) => print("Error: $error"));
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
          screenId: 7,
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
                title: 'Set your weekly goal',
                description:
                    'How many days per week can you dedicate to one workout plan?',
              ),
            ),

            /// Middle of the screen
            /// Week days buttons holder
            Expanded(
              child: GridView.count(
                padding: const EdgeInsets.only(
                  top: kPadding8,
                  bottom: kPadding8,
                ),
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
                primary: false,
                children: [
                  /// 1 day a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 1;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 1,
                    title: '1 Day',
                    description: 'Dedicate 1 day a week',
                  ),

                  /// 2 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 2;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 2,
                    title: '2 Days',
                    description: 'Dedicate 2 days a week',
                  ),

                  /// 3 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 3;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 3,
                    title: '3 Days',
                    description: 'Dedicate 3 days a week',
                  ),

                  /// 4 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 4;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 4,
                    title: '4 Days',
                    description: 'Dedicate 4 days a week',
                  ),

                  /// 5 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 5;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 5,
                    title: '5 Days',
                    description: 'Dedicate 5 days a week',
                  ),

                  /// 6 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 6;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 6,
                    title: '6 Days',
                    description: 'Dedicate 6 days a week',
                  ),

                  /// 7 days a week button
                  DayButton(
                    onPressed: () {
                      setState(() {
                        _userSelectedDays = 7;
                      });
                      // print(_userSelectedDays);
                    },
                    userSelectedDays: _userSelectedDays,
                    selectedDays: 7,
                    title: '7 Days',
                    description: 'Dedicate 7 days a week',
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
              child: ElevatedButton(
                onPressed: () {
                  // Calling the setData method to add data to the database
                  _setData();
                  // When the button is clicked, navigate to the home page
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          const BottomNavigationBarScreenScreen(),
                    ),
                  );
                },
                style: kNextButtonStyle,
                child: const Text(
                  "Start",
                  style: kNextButtonTextStyle,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Button to select how many days the user can dedicate to the workout plan
class DayButton extends StatelessWidget {
  const DayButton({
    super.key,
    required this.userSelectedDays,
    required this.selectedDays,
    required this.onPressed,
    required this.title,
    required this.description,
  });

  final int userSelectedDays;
  final int selectedDays;
  final String title;
  final String description;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kDayButtonStyle.copyWith(
        backgroundColor: userSelectedDays == selectedDays
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: kDayButtonTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kWhiteThemeColor
                  : kBlueThemeColor,
            ),
          ),
          Text(
            description,
            style: kDayButtonTextStyle.copyWith(
              color: userSelectedDays == selectedDays
                  ? kGreyThemeColor02
                  : kGreyThemeColor,
              fontSize: 14.0,
            ),
          ),
        ],
      ),
    );
  }
}

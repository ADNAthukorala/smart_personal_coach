import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/workout_plan_screen/workout_plan_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Creating an instance of FirebaseAuth
  final _auth = FirebaseAuth.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

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

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning';
    }
    if (hour < 17) {
      return 'Good Afternoon';
    }
    return 'Good Evening';
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),

      /// Body of the screen
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(loggedInUser.email)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading workout plan..."));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          // Access the data from the snapshot
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          String userName = data["userName"];
          String mainGoal = data["mainGoal"];
          String level = data["level"];
          int weeklyGoal = data["weeklyGoal"];
          List<dynamic> focusedBodyAreas = data["focusedBodyAreas"];

          String reps = "";
          String sets = "";

          if (mainGoal == "Loose Weight") {
            reps = "12-20";
            sets = "2 - 3";
          } else if (mainGoal == "Build Muscles") {
            reps = "6-12";
            sets = "3-4";
          } else {
            reps = "6-20";
            sets = "2-4";
          }

          return ListView(
            padding: const EdgeInsets.all(kPadding16),
            primary: false,
            children: [
              /// Welcome message
              Text(
                "${greeting()} $userName!",
                style: kLargeBlackTitleTextStyle.copyWith(
                  color: kAppThemeColor,
                  height: 1,
                ),
              ),

              /// Adding space
              const SizedBox(height: 12.0),

              /// Workout Plan
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title Workout Plan
                      const Text(
                        "Workout Plan",
                        style: kLargeBlackTitleTextStyle,
                      ),

                      /// Adding space
                      const SizedBox(height: 12.0),

                      /// Instructions
                      const Text(
                        "Instructions",
                        style: TextStyle(
                            fontSize: 22.0, fontWeight: FontWeight.w700),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Main Goal
                      const Text(
                        "Main Goal",
                        style: kProfileTitleTextStyle,
                      ),
                      Text(
                        "Your main goal is to $mainGoal, so aim for $sets sets of $reps reps per exercise.",
                        textAlign: TextAlign.center,
                        style: kSmallGreyColorDescriptionTextStyle.copyWith(
                            color: kBlackThemeColor,
                            fontWeight: FontWeight.w400),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Weekly goal
                      const Text(
                        "Weekly Goal",
                        style: kProfileTitleTextStyle,
                      ),
                      Text(
                        "Your weekly goal is to perform all the exercises listed within $weeklyGoal days of the week.",
                        textAlign: TextAlign.center,
                        style: kSmallGreyColorDescriptionTextStyle.copyWith(
                            color: kBlackThemeColor,
                            fontWeight: FontWeight.w400),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Focused body areas
                      const Text(
                        "Focused Body Areas",
                        style: kProfileTitleTextStyle,
                      ),
                      Text(
                        focusedBodyAreas
                            .toString()
                            .split("[")
                            .last
                            .split("]")
                            .first,
                        textAlign: TextAlign.center,
                        style: kSmallGreyColorDescriptionTextStyle.copyWith(
                            color: kBlackThemeColor,
                            fontWeight: FontWeight.w400),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Equipments
                      const Text(
                        "Equipments",
                        style: kProfileTitleTextStyle,
                      ),
                      Text(
                        "For optimum results, we recommend using Kettlebells or Dumbbells for weighted exercises.",
                        textAlign: TextAlign.center,
                        style: kSmallGreyColorDescriptionTextStyle.copyWith(
                            color: kBlackThemeColor,
                            fontWeight: FontWeight.w400),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Exercises
                      Text(
                        "Exercises - $level Level",
                        style: kProfileTitleTextStyle,
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => WorkoutPlanScreenScreen(
                                focusedBodyAreas: focusedBodyAreas,
                                loggedInUserEmail: loggedInUser.email,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kAppThemeColor),
                        child: Text(
                          "Show Exercises",
                          style: kSmallGreyColorDescriptionTextStyle.copyWith(
                              color: kWhiteThemeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

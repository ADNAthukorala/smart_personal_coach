import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/app_brain/generate_the_workout_plan.dart';
import 'package:smart_personal_coach/app_brain/workout_plan_card.dart';
import 'package:smart_personal_coach/constants.dart';

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
            padding: const EdgeInsets.only(
              left: kPadding16,
              top: kPadding16,
              right: kPadding16,
            ),
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

              /// Title Workout Plan
              Container(
                alignment: Alignment.center,
                child: const Text(
                  "Workout Plan",
                  style: kLargeBlackTitleTextStyle,
                ),
              ),

              /// Adding space
              const SizedBox(height: 12.0),

              /// Main Goal
              const Text(
                "Main Goal",
                style: kProfileTitleTextStyle,
              ),
              Text(
                "Your main goal is to $mainGoal, so aim for $sets sets of $reps reps per exercise.",
                style: kSmallGreyColorDescriptionTextStyle,
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
                style: kSmallGreyColorDescriptionTextStyle,
              ),

              /// Adding space
              const SizedBox(height: 8.0),

              /// Focused body areas
              const Text(
                "Focused Body Areas",
                style: kProfileTitleTextStyle,
              ),
              Text(
                focusedBodyAreas.toString().split("[").last.split("]").first,
                style: kSmallGreyColorDescriptionTextStyle,
              ),

              /// Adding space
              const SizedBox(height: 8.0),

              /// Exercises
              Text(
                "Exercises - $level Level",
                style: kProfileTitleTextStyle,
              ),

              /// Abs Exercises workout plan card
              focusedBodyAreas.contains(abs)
                  ? WorkoutPlanCard(
                      loggedInUserEmail: loggedInUser.email,
                      title: "Abs Exercises",
                      collectionName: absExercisesCollection,
                      workoutPlanExampleExercises: absExercises,
                    )
                  : const SizedBox(),

              /// Arms Exercises workout plan card
              focusedBodyAreas.contains(arms)
                  ? WorkoutPlanCard(
                      loggedInUserEmail: loggedInUser.email,
                      title: "Arms Exercises",
                      collectionName: armsExercisesCollection,
                      workoutPlanExampleExercises: armsExercises,
                    )
                  : const SizedBox(),

              /// Back Exercises workout plan card
              focusedBodyAreas.contains(back)
                  ? WorkoutPlanCard(
                      loggedInUserEmail: loggedInUser.email,
                      title: "Back Exercises",
                      collectionName: backExercisesCollection,
                      workoutPlanExampleExercises: backExercises,
                    )
                  : const SizedBox(),

              /// Chest Exercises workout plan card
              focusedBodyAreas.contains(chest)
                  ? WorkoutPlanCard(
                      loggedInUserEmail: loggedInUser.email,
                      title: "Chest Exercises",
                      collectionName: chestExercisesCollection,
                      workoutPlanExampleExercises: chestExercises,
                    )
                  : const SizedBox(),

              /// Legs Exercises workout plan card
              focusedBodyAreas.contains(legs)
                  ? WorkoutPlanCard(
                      loggedInUserEmail: loggedInUser.email,
                      title: "Legs Exercises",
                      collectionName: legsExercisesCollection,
                      workoutPlanExampleExercises: legsExercises,
                    )
                  : const SizedBox(),
            ],
          );
        },
      ),
    );
  }
}

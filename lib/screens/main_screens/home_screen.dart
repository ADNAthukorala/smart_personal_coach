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

          String mainGoal = data["mainGoal"];
          String level = data["level"];
          int weeklyGoal = data["weeklyGoal"];
          List<dynamic> focusedBodyAreas = data["focusedBodyAreas"];

          return ListView(
            padding: const EdgeInsets.only(
              left: kPadding16,
              top: kPadding16,
              right: kPadding16,
            ),
            primary: false,
            children: [
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

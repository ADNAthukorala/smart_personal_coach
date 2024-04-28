import 'package:flutter/material.dart';
import 'package:smart_personal_coach/app_brain/generate_the_workout_plan.dart';
import 'package:smart_personal_coach/app_brain/workout_plan_card.dart';
import 'package:smart_personal_coach/constants.dart';

class WorkoutPlanExercisesScreen extends StatefulWidget {
  const WorkoutPlanExercisesScreen(
      {super.key, required this.focusedBodyAreas, this.loggedInUserEmail});

  final List<dynamic> focusedBodyAreas;
  final String? loggedInUserEmail;

  @override
  State<WorkoutPlanExercisesScreen> createState() =>
      _WorkoutPlanExercisesScreenState();
}

class _WorkoutPlanExercisesScreenState
    extends State<WorkoutPlanExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Workout Plan Exercises",
          style: kAppBarTextStyle,
        ),
        iconTheme: const IconThemeData(color: kWhiteThemeColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kPadding16),
        primary: false,
        children: [
          /// Abs Exercises workout plan card
          widget.focusedBodyAreas.contains(abs)
              ? WorkoutPlanCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Abs Exercises",
                  collectionName: absExercisesCollection,
                  workoutPlanExampleExercises: absExercises,
                )
              : const SizedBox(),

          /// Arms Exercises workout plan card
          widget.focusedBodyAreas.contains(arms)
              ? WorkoutPlanCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Arms Exercises",
                  collectionName: armsExercisesCollection,
                  workoutPlanExampleExercises: armsExercises,
                )
              : const SizedBox(),

          /// Back Exercises workout plan card
          widget.focusedBodyAreas.contains(back)
              ? WorkoutPlanCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Back Exercises",
                  collectionName: backExercisesCollection,
                  workoutPlanExampleExercises: backExercises,
                )
              : const SizedBox(),

          /// Chest Exercises workout plan card
          widget.focusedBodyAreas.contains(chest)
              ? WorkoutPlanCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Chest Exercises",
                  collectionName: chestExercisesCollection,
                  workoutPlanExampleExercises: chestExercises,
                )
              : const SizedBox(),

          /// Legs Exercises workout plan card
          widget.focusedBodyAreas.contains(legs)
              ? WorkoutPlanCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Legs Exercises",
                  collectionName: legsExercisesCollection,
                  workoutPlanExampleExercises: legsExercises,
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
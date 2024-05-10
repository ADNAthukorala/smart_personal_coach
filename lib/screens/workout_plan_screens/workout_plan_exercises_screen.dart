import 'package:flutter/material.dart';
import 'package:smart_personal_coach/generate_workout_plan_exercises/generate_the_workout_plan_exercises.dart';
import 'package:smart_personal_coach/generate_workout_plan_exercises/workout_plan_exercises_card.dart';
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
              ? WorkoutPlanExercisesCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Abs Exercises",
                  collectionName: absExercisesCollection,
                  workoutPlanExampleExercises: absExercises,
                  motivationalQuote:
                      "Champions aren’t made in the gyms. Champions are made from something they have deep inside them-a desire, a dream, a vision!",
                )
              : const SizedBox(),

          /// Arms Exercises workout plan card
          widget.focusedBodyAreas.contains(arms)
              ? WorkoutPlanExercisesCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Arms Exercises",
                  collectionName: armsExercisesCollection,
                  workoutPlanExampleExercises: armsExercises,
                  motivationalQuote:
                      "Success isn’t always about greatness. It’s about consistency. Consistent hard work gains success. Greatness will come!",
                )
              : const SizedBox(),

          /// Back Exercises workout plan card
          widget.focusedBodyAreas.contains(back)
              ? WorkoutPlanExercisesCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Back Exercises",
                  collectionName: backExercisesCollection,
                  workoutPlanExampleExercises: backExercises,
                  motivationalQuote:
                      "Just believe in yourself. Even if you don’t, just pretend that you do and at some point, you will!",
                )
              : const SizedBox(),

          /// Chest Exercises workout plan card
          widget.focusedBodyAreas.contains(chest)
              ? WorkoutPlanExercisesCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Chest Exercises",
                  collectionName: chestExercisesCollection,
                  workoutPlanExampleExercises: chestExercises,
                  motivationalQuote:
                      "The harder you work and the more prepared you are for something, you’re going to be able to persevere through anything!",
                )
              : const SizedBox(),

          /// Legs Exercises workout plan card
          widget.focusedBodyAreas.contains(legs)
              ? WorkoutPlanExercisesCard(
                  loggedInUserEmail: widget.loggedInUserEmail,
                  title: "Legs Exercises",
                  collectionName: legsExercisesCollection,
                  workoutPlanExampleExercises: legsExercises,
                  motivationalQuote:
                      "Fitness is not about being better than someone else. It’s about being better than you used to be!",
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}

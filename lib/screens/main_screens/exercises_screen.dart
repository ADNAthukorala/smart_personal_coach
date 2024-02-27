import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/exercises_screens/abs_exercises_screen.dart';
import 'package:smart_personal_coach/screens/exercises_screens/arms_exercises_screen.dart';
import 'package:smart_personal_coach/screens/exercises_screens/back_exercises_screen.dart';
import 'package:smart_personal_coach/screens/exercises_screens/chest_exercises_screen.dart';
import 'package:smart_personal_coach/screens/exercises_screens/legs_exercises_screen.dart';
import 'package:smart_personal_coach/screens/exercises_screens/meditation_exercises_screen.dart';

/// Exercises screen
class ExercisesScreen extends StatefulWidget {
  const ExercisesScreen({super.key});

  @override
  State<ExercisesScreen> createState() => _ExercisesScreenState();
}

class _ExercisesScreenState extends State<ExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// Appbar
      appBar: AppBar(
        title: const Text(
          'EXERCISES',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),

      /// Body of the screen
      body: GridView.count(
        padding: const EdgeInsets.all(kPadding16),
        crossAxisCount: 2,
        mainAxisSpacing: 16.0,
        crossAxisSpacing: 10.0,
        primary: false,
        children: [
          /// Abs button
          ButtonWithBackgroundImageAndText(
            image: "images/abs.jpg",
            text: "ABS",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const AbsExercisesScreen(),
                ),
              );
            },
          ),

          /// Arms button
          ButtonWithBackgroundImageAndText(
            image: "images/arms.jpg",
            text: "ARMS",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ArmsExercisesScreen(),
                ),
              );
            },
          ),

          /// Back button
          ButtonWithBackgroundImageAndText(
            image: "images/back.jpg",
            text: "BACK",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BackExercisesScreen(),
                ),
              );
            },
          ),

          /// Chest button
          ButtonWithBackgroundImageAndText(
            image: "images/chest.jpg",
            text: "CHEST",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const ChestExercisesScreen(),
                ),
              );
            },
          ),

          /// Legs button
          ButtonWithBackgroundImageAndText(
            image: "images/legs.jpg",
            text: "LEGS",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const LegsExercisesScreen(),
                ),
              );
            },
          ),

          /// Meditation button
          ButtonWithBackgroundImageAndText(
            image: "images/meditation.jpg",
            text: "MED",
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const MeditationExercisesScreen(),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class ButtonWithBackgroundImageAndText extends StatelessWidget {
  const ButtonWithBackgroundImageAndText({
    super.key,
    required this.image,
    required this.text,
    this.onPressed,
  });

  final String image;
  final String text;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: kExercisesScreenButton,
      onPressed: onPressed,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              borderRadius: BorderRadius.circular(kRadius16),
            ),
          ),
          Text(
            text,
            style: kExercisesScreenButtonTextStyle,
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/exercises_screens/chest_exercises_screen.dart';

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
      body: Padding(
        // Add padding around the body
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
        ),
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
            /// Abs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ABS',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/abs.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),

            /// Arms button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'ARMS',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/arms.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),

            /// Back button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'BACK',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/back.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),

            /// Chest button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ChestExercisesScreen(),
                  ),
                );
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'CHEST',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/chest.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),

            /// Legs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'LEGS',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/legs.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),

            /// Meditation button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'MED',
                    style: kExercisesScreenButtonTextStyle,
                  ),
                  Image.asset(
                    'images/meditation.png',
                    color: kWhiteThemeColor,
                    height: 100.0,
                    width: 100.0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

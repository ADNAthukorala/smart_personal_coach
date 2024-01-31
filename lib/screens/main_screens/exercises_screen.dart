import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

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

          crossAxisCount: 2,
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
          primary: false,
          children: [
            /// Abs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'ABS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Arms button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'ARMS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Back button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'BACK',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Chest button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'CHEST',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Legs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'LEGS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

          ],
        ),
      ),
    );
  }
}

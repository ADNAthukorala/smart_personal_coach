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
        child: ListView(
          padding: EdgeInsets.zero,
          // If the viewport's max height is greater than 800, the listview never scrolls, otherwise scrolls
          physics: MediaQuery.of(context).size.height > 800
              ? const NeverScrollableScrollPhysics()
              : const AlwaysScrollableScrollPhysics(),
          children: [
            /// Add space
            const SizedBox(height: 12.0),

            /// Abs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'ABS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Add space between buttons
            const SizedBox(height: 12.0),

            /// Arms button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'ARMS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Add space between buttons
            const SizedBox(height: 12.0),

            /// Back button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'BACK',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Add space between buttons
            const SizedBox(height: 12.0),

            /// Chest button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'CHEST',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Add space between buttons
            const SizedBox(height: 12.0),

            /// Legs button
            ElevatedButton(
              style: kExercisesScreenButton,
              onPressed: () {},
              child: const Text(
                'LEGS',
                style: kExercisesScreenButtonTextStyle,
              ),
            ),

            /// Add space
            const SizedBox(height: 12.0),
          ],
        ),
      ),
    );
  }
}

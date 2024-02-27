import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/exercise_card.dart';
import 'package:smart_personal_coach/constants.dart';

class MeditationExercisesScreen extends StatefulWidget {
  const MeditationExercisesScreen({super.key});

  @override
  State<MeditationExercisesScreen> createState() =>
      _MeditationExercisesScreenState();
}

class _MeditationExercisesScreenState extends State<MeditationExercisesScreen> {
  final String _focusedBodyArea = "meditation_exercises";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: const Text(
          "Meditation Exercises",
          style: kAppBarTextStyle,
        ),
        iconTheme: const IconThemeData(color: kWhiteThemeColor),
      ),

      /// Body of the screen
      body: StreamBuilder(
        stream:
            FirebaseFirestore.instance.collection(_focusedBodyArea).snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text("Something went wrong");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text("Loading...");
          }

          if (!snapshot.hasData) {
            return const Text("No data available");
          }

          return ListView.builder(
            padding: const EdgeInsets.all(kPadding16),
            primary: false,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: kPadding8),
                child: ListTile(
                  tileColor: kAppThemeColor,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(kRadius16)),
                  title: Text(
                    document["name"],
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, color: kWhiteThemeColor),
                  ),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ExerciseCard(
                          focusedBodyArea: _focusedBodyArea,
                          nameOfTheExercise: document["name"],
                        );
                      },
                    );
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}

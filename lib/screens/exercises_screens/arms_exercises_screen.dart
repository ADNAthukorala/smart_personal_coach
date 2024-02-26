import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/exercise_card.dart';
import 'package:smart_personal_coach/constants.dart';

class ArmsExercisesScreen extends StatefulWidget {
  const ArmsExercisesScreen({super.key});

  @override
  State<ArmsExercisesScreen> createState() => _ArmsExercisesScreenState();
}

class _ArmsExercisesScreenState extends State<ArmsExercisesScreen> {
  final String _focusedBodyArea = "arms_exercises";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: const Text(
          "Arms Exercises",
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
            padding: const EdgeInsets.all(kPadding12),
            primary: false,
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot document = snapshot.data!.docs[index];
              return Padding(
                padding: const EdgeInsets.only(bottom: kPadding12),
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

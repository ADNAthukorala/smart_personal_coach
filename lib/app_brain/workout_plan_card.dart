import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/app_brain/workout_plan_card_list_tile.dart';
import 'package:smart_personal_coach/constants.dart';

class WorkoutPlanCard extends StatelessWidget {
  const WorkoutPlanCard({
    super.key,
    required this.collectionName,
    required this.title,
    required this.loggedInUserEmail,
    required this.workoutPlanExampleExercises,
  });

  final String collectionName;
  final String title;
  final String? loggedInUserEmail;
  final String workoutPlanExampleExercises;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
      stream: FirebaseFirestore.instance
          .collection('users')
          .doc(loggedInUserEmail)
          .snapshots(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading exercises..."));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No data available"));
        }

        // Access the data from the snapshot
        Map<String, dynamic> data =
            snapshot.data!.data() as Map<String, dynamic>;

        List<dynamic> workoutPlanExercises = data[workoutPlanExampleExercises];

        return SizedBox(
          height: 400.0,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(kRadius16)),
                side: BorderSide(color: kAppThemeColor)),
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: kAppThemeColor,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(kRadius16),
                        topRight: Radius.circular(kRadius16)),
                  ),
                  width: double.maxFinite,
                  height: 50.0,
                  child: Text(
                    title,
                    style: const TextStyle(
                      color: kWhiteThemeColor,
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    padding: const EdgeInsets.only(
                      left: kPadding8,
                      top: kPadding8,
                      right: kPadding8,
                    ),
                    primary: false,
                    itemCount: workoutPlanExercises.length,
                    itemBuilder: (context, index) {
                      String exercise = workoutPlanExercises.elementAt(index);
                      return Padding(
                        // Adding space between two exercises list tiles
                        padding: const EdgeInsets.only(bottom: kPadding8),
                        child: WorkoutPlanCardListTile(
                          collectionName: collectionName,
                          docName: exercise,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    color: kAppThemeColor,
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(kRadius16),
                        bottomRight: Radius.circular(kRadius16)),
                  ),
                  width: double.maxFinite,
                  height: 50.0,
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text("Start"),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

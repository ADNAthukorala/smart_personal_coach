import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/app_brain/workout_plan_card_list_tile.dart';
import 'package:smart_personal_coach/constants.dart';

class WorkoutPlanCard extends StatelessWidget {
  const WorkoutPlanCard({
    super.key,
    required this.collectionName,
    required this.title,
    required this.exercise1,
    required this.exercise2,
  });

  final String collectionName;
  final String exercise1;
  final String exercise2;
  final String title;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection(collectionName).snapshots(),
      builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) {
          return const Center(child: Text("Something went wrong"));
        }

        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: Text("Loading exercises..."));
        }

        if (!snapshot.hasData) {
          return const Center(child: Text("No data available"));
        }

        return SizedBox(
          height: 200.0,
          child: Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
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
                  child: ListView(
                    padding: const EdgeInsets.all(kPadding8),
                    primary: false,
                    children: [
                      WorkoutPlanCardListTile(
                        collectionName: collectionName,
                        docName: exercise1,
                      ),
                      const SizedBox(height: 8.0),
                      WorkoutPlanCardListTile(
                        collectionName: collectionName,
                        docName: exercise2,
                      ),
                    ],
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

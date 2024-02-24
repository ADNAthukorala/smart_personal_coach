import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/exercise_card.dart';
import 'package:smart_personal_coach/constants.dart';

class ChestExercisesScreen extends StatefulWidget {
  const ChestExercisesScreen({super.key});

  @override
  State<ChestExercisesScreen> createState() => _ChestExercisesScreenState();
}

class _ChestExercisesScreenState extends State<ChestExercisesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// App Bar
      appBar: AppBar(
        title: const Text(
          'Chest Exercises',
          style: kAppBarTextStyle,
        ),
        iconTheme: const IconThemeData(color: kWhiteThemeColor),
      ),

      /// Body of the screen
      body: Padding(
        padding: const EdgeInsets.only(
          left: kPadding16,
          right: kPadding16,
          bottom: kPadding16,
        ),
        child: StreamBuilder(
          stream: FirebaseFirestore.instance
              .collection('chest_exercises')
              .snapshots(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Text('Something went wrong');
            }

            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Text("Loading...");
            }

            if (!snapshot.hasData) {
              return const Text('No data available');
            }

            return ListView.builder(
              padding: const EdgeInsets.only(
                top: kPadding8,
                bottom: kPadding8,
              ),
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
                      document['title'],
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, color: kWhiteThemeColor),
                    ),
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return ExerciseCard(
                            collection: "chest_exercises",
                            document: document['title'],
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
      ),
    );
  }
}

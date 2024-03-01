import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.collectionName,
    required this.docName,
  });

  final String collectionName;
  final String docName;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(collectionName)
            .doc(docName)
            .snapshots(),
        builder: (context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Text('Something went wrong');
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Text(
              "Loading...",
              style: TextStyle(color: kAppThemeColor),
            );
          }

          if (!snapshot.hasData) {
            return const Text('No data available');
          }

          // Access the data from the snapshot
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          return Card(
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
            surfaceTintColor: kWhiteThemeColor,
            color: kWhiteThemeColor,
            child: ListView(
              padding: const EdgeInsets.all(kPadding16),
              primary: false,
              children: [
                /// Animation image
                CachedNetworkImage(
                  imageUrl: data['animationImage'],
                  placeholder: (context, url) => const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircularProgressIndicator(),
                        Text("Loading animation...")
                      ],
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                  height: 300,
                ),

                /// Name of the exercise
                Text(
                  data['name'],
                  style: kExerciseCardTitleTextStyle,
                ),

                /// Divider line
                const Divider(),

                /// Introduction
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    const Text(
                      "Introduction",
                      style: kExerciseCardSubtitleTextStyle,
                    ),
                    Text(
                      data['introduction'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),
                  ],
                ),

                /// Adding space
                const SizedBox(height: 12.0),

                /// How to do the exercise
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    const Text(
                      "How To Do The Exercise",
                      style: kExerciseCardSubtitleTextStyle,
                    ),

                    // Step 01
                    const Text(
                      "Step 1",
                      style: kExerciseCardStepTextStyle,
                    ),
                    Text(
                      data['step1'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),

                    // Step 02
                    const Text(
                      "Step 2",
                      style: kExerciseCardStepTextStyle,
                    ),
                    Text(
                      data['step2'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),

                    // Step 03
                    const Text(
                      "Step 3",
                      style: kExerciseCardStepTextStyle,
                    ),
                    Text(
                      data['step3'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),

                    // Step 04
                    const Text(
                      "Step 4",
                      style: kExerciseCardStepTextStyle,
                    ),
                    Text(
                      data['step4'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),
                  ],
                ),

                /// Adding space
                const SizedBox(height: 12.0),

                /// Common mistakes
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    const Text(
                      "Common Mistakes",
                      style: kExerciseCardSubtitleTextStyle,
                    ),
                    Text(
                      data['commonMistakes'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),
                  ],
                ),

                /// Adding space
                const SizedBox(height: 12.0),

                /// Muscles worked
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    // Title
                    const Text(
                      "Muscles Worked",
                      style: kExerciseCardSubtitleTextStyle,
                    ),

                    // Image
                    CachedNetworkImage(
                      imageUrl: data['musclesWorkedImage'],
                      placeholder: (context, url) => const Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircularProgressIndicator(),
                            Text("Loading image...")
                          ],
                        ),
                      ),
                      errorWidget: (context, url, error) =>
                          const Icon(Icons.error),
                      height: 300,
                    ),
                  ],
                ),

                /// Adding space
                const SizedBox(height: 12.0),

                /// Close button
                ListTile(
                  title: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kAppThemeColor),
                    onPressed: () => Navigator.pop(context),
                    child: const Text(
                      "Close",
                      style: TextStyle(
                        color: kWhiteThemeColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }
}

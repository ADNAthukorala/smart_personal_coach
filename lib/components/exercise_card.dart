import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.focusedBodyArea,
    required this.nameOfTheExercise,
  });

  final String focusedBodyArea;
  final String nameOfTheExercise;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(focusedBodyArea)
            .doc(nameOfTheExercise)
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
            surfaceTintColor: kWhiteThemeColor,
            color: kWhiteThemeColor,
            child: ListView(
              padding: const EdgeInsets.all(kPadding8),
              primary: false,
              children: [
                /// Animation image
                SizedBox(
                  height: 300,
                  child: CachedNetworkImage(
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
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),

                /// Name of the exercise
                Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      data['name'],
                      style: const TextStyle(
                        color: kAppThemeColor,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      data['description'],
                      style: kExerciseCardDescriptionTextStyle,
                    ),
                  ],
                ),

                /// Divider line
                const Divider(),

                /// How to do the exercise
                Padding(
                  padding: const EdgeInsets.only(
                    bottom: kPadding8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      const Text(
                        "How To Do",
                        style: kExerciseCardTitleTextStyle,
                      ),

                      // Step 01
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Step 1",
                            style: kExerciseCardStepTextStyle,
                          ),
                          Text(
                            data['step1'],
                            style: kExerciseCardDescriptionTextStyle,
                          ),
                        ],
                      ),

                      // Step 02
                      Padding(
                        padding: const EdgeInsets.only(
                          top: kPadding8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Step 2",
                              style: kExerciseCardStepTextStyle,
                            ),
                            Text(
                              data['step2'],
                              style: kExerciseCardDescriptionTextStyle,
                            ),
                          ],
                        ),
                      ),

                      // Step 03
                      Padding(
                        padding: const EdgeInsets.only(
                          top: kPadding8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Step 3",
                              style: kExerciseCardStepTextStyle,
                            ),
                            Text(
                              data['step3'],
                              style: kExerciseCardDescriptionTextStyle,
                            ),
                          ],
                        ),
                      ),

                      // Step 04
                      Padding(
                        padding: const EdgeInsets.only(
                          top: kPadding8,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                      ),
                    ],
                  ),
                ),

                /// Common mistakes
                Padding(
                  padding: const EdgeInsets.only(
                    top: kPadding8,
                    bottom: kPadding8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      const Text(
                        "Common Mistakes",
                        style: kExerciseCardTitleTextStyle,
                      ),
                      Text(
                        data['commonMistakes'],
                        style: kExerciseCardDescriptionTextStyle,
                      ),
                    ],
                  ),
                ),

                /// Muscles worked
                Padding(
                  padding: const EdgeInsets.only(
                    top: kPadding8,
                    bottom: kPadding8,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      // Title
                      const Text(
                        "Which Muscles Are Worked?",
                        style: kExerciseCardTitleTextStyle,
                      ),

                      // Image
                      SizedBox(
                        height: 280.0,
                        child: CachedNetworkImage(
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
                        ),
                      ),
                    ],
                  ),
                ),

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

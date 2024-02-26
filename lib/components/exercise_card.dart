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
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: SizedBox(
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
                ),

                /// Name of the exercise
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    data['name'],
                    style: const TextStyle(
                      color: kAppThemeColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// Divider line
                const Divider(),

                /// Step 01
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    data['step1'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// Step 02
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    data['step2'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// Step 03
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    data['step3'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// Step 04
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    data['step4'],
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),

                /// Muscles worked (Title)
                const ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(
                    "Muscles Worked",
                    style: TextStyle(
                      color: kAppThemeColor,
                      fontSize: 24.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),

                /// Muscles worked image
                ListTile(
                  contentPadding: EdgeInsets.zero,
                  title: SizedBox(
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

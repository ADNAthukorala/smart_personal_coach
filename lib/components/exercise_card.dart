import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.collection,
    required this.document,
  });

  final String collection;
  final String document;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection(collection)
            .doc(document)
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
            child: Padding(
              padding: const EdgeInsets.all(kPadding16),
              child: ListView(
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
                              Text("Loading image...")
                            ],
                          ),
                        ),
                        errorWidget: (context, url, error) =>
                            const Icon(Icons.error),
                      ),
                    ),
                  ),

                  /// Title
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data['title'],
                      style: const TextStyle(
                        color: kAppThemeColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Divider line
                  const Divider(),

                  /// Description 01
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data['description01'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Description 02
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data['description02'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Description 03
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data['description03'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Description 04
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      data['description04'],
                      style: const TextStyle(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  /// Focus area (Title)
                  const ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: Text(
                      "Focus Areas",
                      style: TextStyle(
                        color: kAppThemeColor,
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  /// Focus areas (Image)
                  ListTile(
                    contentPadding: EdgeInsets.zero,
                    title: SizedBox(
                      height: 280.0,
                      child: CachedNetworkImage(
                        imageUrl: data['focusAreaImage'],
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
            ),
          );
        });
  }
}

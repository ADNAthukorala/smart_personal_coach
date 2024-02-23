import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    required this.animationImage,
    required this.focusAreaImage,
    required this.title,
    required this.description01,
    required this.description02,
    required this.description03,
    required this.description04,
  });

  final String animationImage;
  final String focusAreaImage;
  final String title;
  final String description01;
  final String description02;
  final String description03;
  final String description04;

  @override
  Widget build(BuildContext context) {
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
                height: 250,
                child: Image.network(
                  animationImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            /// Title
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                title,
                style: const TextStyle(
                  color: kBlueThemeColor02,
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
                description01,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Description 02
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description02,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Description 03
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description03,
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            /// Description 04
            ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(
                description04,
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
                  color: kBlueThemeColor02,
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
                child: Image.network(
                  focusAreaImage,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),

            /// Close button
            ListTile(
              title: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    backgroundColor: kBlueThemeColor02),
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
  }
}

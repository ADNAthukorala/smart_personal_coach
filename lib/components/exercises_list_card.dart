import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/exercise_card.dart';
import 'package:smart_personal_coach/constants.dart';

class ExercisesListCard extends StatelessWidget {
  const ExercisesListCard({
    super.key,
    required this.collectionName,
    required this.document,
  });

  final String collectionName;
  final DocumentSnapshot<Object?> document;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) {
            // When clicked on the exercises list card, return an exercise card
            return ExerciseCard(
              collectionName: collectionName,
              documentName: document["docName"],
            );
          },
        );
      },
      // Adding border and color to the exercises list card
      child: Container(
        decoration: BoxDecoration(
            color: kAppThemeColor,
            borderRadius: BorderRadius.circular(kRadius16),
            border: Border.all(color: kAppThemeColor, width: 2.0)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Name of the exercise
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: kAppThemeColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(kRadius16),
                    bottomLeft: Radius.circular(kRadius16),
                  ),
                ),
                height: 100,
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.all(kPadding8),
                child: Text(
                  document["name"],
                  style: kExercisesListCardTextStyle,
                ),
              ),
            ),

            /// Animation container
            CachedNetworkImage(
              imageUrl: document["animationImage"],
              imageBuilder: (context, imageProvider) => Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: imageProvider,
                  ),
                  borderRadius:
                      const BorderRadius.all(Radius.circular(kRadius16)),
                ),
              ),
              placeholder: (context, url) => Container(
                alignment: Alignment.center,
                color: kWhiteThemeColor,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CircularProgressIndicator(),
                    Text(
                      "Loading animation...",
                      style: TextStyle(fontSize: 12.0),
                      textAlign: TextAlign.center,
                    )
                  ],
                ),
              ),
              errorWidget: (context, url, error) => const Icon(Icons.error),
              height: 100,
              width: 100,
            ),
          ],
        ),
      ),
    );
  }
}

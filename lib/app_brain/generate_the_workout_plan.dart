import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getExercises({
  required String collectionName,
  required String? loggedInUserEmail,
  required String typeOfExercise,
  required String difficulty,
}) async {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;
  final CollectionReference collection = firestore.collection(collectionName);
  final CollectionReference targetCollection = firestore.collection("users");

  List<String> selectedExercisesList = [];

  try {
    QuerySnapshot querySnapshot = await collection.get();
    List<DocumentSnapshot> documents = querySnapshot.docs;

    if (documents.length >= 2) {
      // Shuffle the documents to get a random order
      documents.shuffle();

      for (DocumentSnapshot document in documents) {
        // Check if the document meets your condition
        if (document.get("difficulty") == difficulty) {
          if (!selectedExercisesList.contains(document.id)) {
            selectedExercisesList.add(document.id);
          }
          // If the list length is 2, stop the loop
          if (selectedExercisesList.length == 2) {
            break;
          }
        }
      }

      // Add the string list to the target collection
      await targetCollection.doc(loggedInUserEmail).set(
        {
          typeOfExercise: selectedExercisesList,
        },
        SetOptions(merge: true),
      );
    } else {
      // Handle the case when there are less than two exercises in the collection
      print('There are less than two documents in the collection.');
    }
  } catch (e) {
    print(e);
  }
}

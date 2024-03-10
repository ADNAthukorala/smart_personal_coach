import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> getBeginnerExercises(
    {required String collectionName,
    required String? loggedInUserEmail,
    required String typeOfExercise}) async {
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
        if (document.get("difficulty") == "Easy") {
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

Future<void> getIntermediateExercises(
    {required String collectionName,
    required String? loggedInUserEmail,
    required String typeOfExercise}) async {
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
        if (document.get("difficulty") == "Easy" ||
            document.get("difficulty") == "Moderate") {
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

Future<void> getAdvancedExercises(
    {required String collectionName,
    required String? loggedInUserEmail,
    required String typeOfExercise}) async {
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
        if (document.get("difficulty") == "Easy" ||
            document.get("difficulty") == "Moderate" ||
            document.get("difficulty") == "Challenging") {
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

Future<void> generateBeginnerWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  if (focusedBodyAreas.contains("Abs")) {
    await getBeginnerExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  if (focusedBodyAreas.contains("Arms")) {
    await getBeginnerExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  if (focusedBodyAreas.contains("Back")) {
    await getBeginnerExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  if (focusedBodyAreas.contains("Chest")) {
    await getBeginnerExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  if (focusedBodyAreas.contains("Legs")) {
    await getBeginnerExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

Future<void> generateIntermediateWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  if (focusedBodyAreas.contains("Abs")) {
    await getIntermediateExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  if (focusedBodyAreas.contains("Arms")) {
    await getIntermediateExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  if (focusedBodyAreas.contains("Back")) {
    await getIntermediateExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  if (focusedBodyAreas.contains("Chest")) {
    await getIntermediateExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  if (focusedBodyAreas.contains("Legs")) {
    await getIntermediateExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

Future<void> generateAdvancedWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  if (focusedBodyAreas.contains("Abs")) {
    await getAdvancedExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  if (focusedBodyAreas.contains("Arms")) {
    await getAdvancedExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  if (focusedBodyAreas.contains("Back")) {
    await getAdvancedExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  if (focusedBodyAreas.contains("Chest")) {
    await getAdvancedExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  if (focusedBodyAreas.contains("Legs")) {
    await getAdvancedExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

Future<void> generateTheWorkoutPlan(
    {required String userLevel,
    required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  if (userLevel == "Beginner") {
    await generateBeginnerWorkoutPlan(
      loggedInUserEmail: loggedInUserEmail,
      focusedBodyAreas: focusedBodyAreas,
    );
  }

  if (userLevel == "Intermediate") {
    await generateIntermediateWorkoutPlan(
      loggedInUserEmail: loggedInUserEmail,
      focusedBodyAreas: focusedBodyAreas,
    );
  }

  if (userLevel == "Advanced") {
    await generateAdvancedWorkoutPlan(
      loggedInUserEmail: loggedInUserEmail,
      focusedBodyAreas: focusedBodyAreas,
    );
  }
}

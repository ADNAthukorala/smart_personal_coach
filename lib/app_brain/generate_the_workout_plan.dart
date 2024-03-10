import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';

/// Select exercises for Beginners
Future<void> selectExercisesForBeginners(
    {required String collectionName,
    required String? loggedInUserEmail,
    required String typeOfExercise}) async {
  final firestore = FirebaseFirestore.instance;
  final collection = firestore.collection(collectionName);
  final targetCollection = firestore.collection("users");

  // List to store selected exercises
  List<String> selectedExercisesList = [];

  try {
    QuerySnapshot querySnapshot = await collection.get();
    List<DocumentSnapshot> allExercises = querySnapshot.docs;

    if (allExercises.length >= 2) {
      // Shuffle the documents to get a random order
      allExercises.shuffle();

      for (DocumentSnapshot randomExercise in allExercises) {
        // Check if the random exercise meets the condition
        if (randomExercise["difficulty"] == "Easy") {
          if (!selectedExercisesList.contains(randomExercise.id)) {
            // Add the random exercise to the selected exercises list
            selectedExercisesList.add(randomExercise.id);
          }
          // If the selected exercises length is 2, stop the loop
          if (selectedExercisesList.length == 2) {
            break;
          }
        }
      }

      // Add the selected exercises list to the workout plan
      await targetCollection.doc(loggedInUserEmail).set(
        {
          typeOfExercise: selectedExercisesList,
        },
        SetOptions(merge: true),
      );
    } else {
      // When there are less than two exercises in the collection, show the error message
      print('There are less than two documents in the collection.');
    }
  } catch (e) {
    print(e);
  }
}

/// Getting exercises for Intermediate
Future<void> gettingExercisesForIntermediate(
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

/// Getting exercises for Advanced
Future<void> gettingExercisesForAdvanced(
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

/// Generate workout plans for Beginner users
Future<void> generateBeginnerWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  // If the user focuses on abs, he/she will get abs exercises.
  if (focusedBodyAreas.contains("Abs")) {
    await selectExercisesForBeginners(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  // If the user focuses on arms, he/she will get arms exercises.
  if (focusedBodyAreas.contains("Arms")) {
    await selectExercisesForBeginners(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  // If the user focuses on back, he/she will get back exercises.
  if (focusedBodyAreas.contains("Back")) {
    await selectExercisesForBeginners(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  // If the user focuses on chest, he/she will get chest exercises.
  if (focusedBodyAreas.contains("Chest")) {
    await selectExercisesForBeginners(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  // If the user focuses on legs, he/she will get legs exercises.
  if (focusedBodyAreas.contains("Legs")) {
    await selectExercisesForBeginners(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

/// Generate workout plans for Intermediate users
Future<void> generateIntermediateWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  // If the user focuses on abs, he/she will get abs exercises.
  if (focusedBodyAreas.contains("Abs")) {
    await gettingExercisesForIntermediate(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  // If the user focuses on arms, he/she will get arms exercises.
  if (focusedBodyAreas.contains("Arms")) {
    await gettingExercisesForIntermediate(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  // If the user focuses on back, he/she will get back exercises.
  if (focusedBodyAreas.contains("Back")) {
    await gettingExercisesForIntermediate(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  // If the user focuses on chest, he/she will get chest exercises.
  if (focusedBodyAreas.contains("Chest")) {
    await gettingExercisesForIntermediate(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  // If the user focuses on legs, he/she will get legs exercises.
  if (focusedBodyAreas.contains("Legs")) {
    await gettingExercisesForIntermediate(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

/// Generate workout plans for Advanced users
Future<void> generateAdvancedWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  // If the user focuses on abs, he/she will get abs exercises.
  if (focusedBodyAreas.contains("Abs")) {
    await gettingExercisesForAdvanced(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  // If the user focuses on arms, he/she will get arms exercises.
  if (focusedBodyAreas.contains("Arms")) {
    await gettingExercisesForAdvanced(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  // If the user focuses on back, he/she will get back exercises.
  if (focusedBodyAreas.contains("Back")) {
    await gettingExercisesForAdvanced(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  // If the user focuses on chest, he/she will get chest exercises.
  if (focusedBodyAreas.contains("Chest")) {
    await gettingExercisesForAdvanced(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  // If the user focuses on legs, he/she will get legs exercises.
  if (focusedBodyAreas.contains("Legs")) {
    await gettingExercisesForAdvanced(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

/// Delete exercises that the user does not care about
Future<void> deleteExercisesFromWorkoutPlan(
    {required String? loggedInUserEmail,
    required String typeOfExercise}) async {
  try {
    // Get reference to the document
    DocumentReference docRef =
        FirebaseFirestore.instance.collection("users").doc(loggedInUserEmail);

    // Delete exercises from the workout plan
    await docRef.update({
      typeOfExercise: FieldValue.delete(),
    });

    print("$typeOfExercise deleted successfully from workout plan");
  } catch (e) {
    print("Error deleting exercise: $e");
  }
}

/// Generate the workout plan
Future<void> generateTheWorkoutPlan(
    {required String userLevel,
    required String? loggedInUserEmail,
    required List<String> focusedBodyAreas}) async {
  try {
    // If the user is a beginner, he/she will get a beginner workout plan
    if (userLevel == "Beginner") {
      await generateBeginnerWorkoutPlan(
        loggedInUserEmail: loggedInUserEmail,
        focusedBodyAreas: focusedBodyAreas,
      );
    }

    // If the user is an intermediate, he/she will get an intermediate workout plan
    if (userLevel == "Intermediate") {
      await generateIntermediateWorkoutPlan(
        loggedInUserEmail: loggedInUserEmail,
        focusedBodyAreas: focusedBodyAreas,
      );
    }

    // If the user is an advanced, he/she will get an advanced workout plan
    if (userLevel == "Advanced") {
      await generateAdvancedWorkoutPlan(
        loggedInUserEmail: loggedInUserEmail,
        focusedBodyAreas: focusedBodyAreas,
      );
    }

    // If the user doesn't care about abs, delete abs exercises from the workout plan
    if (!focusedBodyAreas.contains("Abs")) {
      await deleteExercisesFromWorkoutPlan(
          loggedInUserEmail: loggedInUserEmail, typeOfExercise: "absExercises");
    }

    // If the user doesn't care about arms, delete arms exercises from the workout plan
    if (!focusedBodyAreas.contains("Arms")) {
      await deleteExercisesFromWorkoutPlan(
          loggedInUserEmail: loggedInUserEmail,
          typeOfExercise: "armsExercises");
    }

    // If the user doesn't care about back, delete back exercises from the workout plan
    if (!focusedBodyAreas.contains("Back")) {
      await deleteExercisesFromWorkoutPlan(
          loggedInUserEmail: loggedInUserEmail,
          typeOfExercise: "backExercises");
    }

    // If the user doesn't care about chest, delete chest exercises from the workout plan
    if (!focusedBodyAreas.contains("Chest")) {
      await deleteExercisesFromWorkoutPlan(
          loggedInUserEmail: loggedInUserEmail,
          typeOfExercise: "chestExercises");
    }

    // If the user doesn't care about legs, delete legs exercises from the workout plan
    if (!focusedBodyAreas.contains("Legs")) {
      await deleteExercisesFromWorkoutPlan(
          loggedInUserEmail: loggedInUserEmail,
          typeOfExercise: "legsExercises");
    }
  } catch (e) {
    print("An error has occurred");
  }
}

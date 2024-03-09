import 'package:cloud_firestore/cloud_firestore.dart';

/// Getting random exercises to the workout plan
Future<void> getRandomExercises(
    {required String collectionName,
    required String? loggedInUserEmail,
    required String typeOfExercise}) async {
  // Initialize an instance of Cloud Firestore
  final firestore = FirebaseFirestore.instance;

  // Declare an list array to store exercises
  List<String> selectedExercises = [];

  try {
    // Accessing the collection
    QuerySnapshot querySnapshot =
        await firestore.collection(collectionName).get();

    // Getting all the exercises in the collection
    List<String> allExercises =
        querySnapshot.docs.map((doc) => doc.id).toList();

    // Ensure there are at least two exercises in the collection
    if (allExercises.length >= 2) {
      // Shuffle the list of exercises
      allExercises.shuffle();

      // Take the first two exercises
      selectedExercises = allExercises.take(2).toList();

      // Add them to the firestore
      await firestore.collection("users").doc(loggedInUserEmail).set(
        {
          typeOfExercise: selectedExercises,
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

Future<void> generatingTheWorkoutPlan(
    {required String? loggedInUserEmail,
    required List<String> userSelectedBodyAreas}) async {
  if (userSelectedBodyAreas.contains("Abs")) {
    await getRandomExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "abs_exercises",
      typeOfExercise: "absExercises",
    );
  }

  if (userSelectedBodyAreas.contains("Arms")) {
    await getRandomExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "arms_exercises",
      typeOfExercise: "armsExercises",
    );
  }

  if (userSelectedBodyAreas.contains("Back")) {
    await getRandomExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "back_exercises",
      typeOfExercise: "backExercises",
    );
  }

  if (userSelectedBodyAreas.contains("Chest")) {
    await getRandomExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "chest_exercises",
      typeOfExercise: "chestExercises",
    );
  }

  if (userSelectedBodyAreas.contains("Legs")) {
    await getRandomExercises(
      loggedInUserEmail: loggedInUserEmail,
      collectionName: "legs_exercises",
      typeOfExercise: "legsExercises",
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/bmi_scale.dart';
import 'package:smart_personal_coach/constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // Creating an instance of FirebaseAuth
  final _auth = FirebaseAuth.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  /// Creating a method to get the logged in user
  void getLoggedIntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      // Show snack bar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error has occurred!')),
      );
    }
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'REPORT',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),

      /// Body of the screen
      body: StreamBuilder<DocumentSnapshot>(
        stream: FirebaseFirestore.instance
            .collection('users')
            .doc(loggedInUser.email)
            .snapshots(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text("Something went wrong"));
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: Text("Loading report..."));
          }

          if (!snapshot.hasData) {
            return const Center(child: Text("No data available"));
          }

          // Access the data from the snapshot
          Map<String, dynamic> data =
              snapshot.data!.data() as Map<String, dynamic>;

          // Declare variables to store user information from the data base
          // and assign values to those variables
          String userName = data['userName'];
          String userEmail = data['email'];
          String userGender = data['gender'];
          String userLevel = data['level'];
          String userMainGoal = data['mainGoal'];
          int userHeight = data['height'];
          int userWeight = data['weight'];
          Timestamp userBirthDay = data['birthDay'];

          // Getting the user's age
          int userAge = DateTime.now().year - userBirthDay.toDate().year;

          // Getting the user's BMI value
          double userBMI = double.parse(
              (userWeight / ((userHeight * userHeight) * 0.0001))
                  .toStringAsFixed(2));

          return ListView(
            padding: const EdgeInsets.all(kPadding16),
            primary: false,
            children: [
              /// User name
              Row(
                children: [
                  const Text(
                    "Name:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userName,
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User email
              Row(
                children: [
                  const Text(
                    "Email:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userEmail,
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User age
              Row(
                children: [
                  const Text(
                    "Age:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userAge.toString(),
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User gender
              Row(
                children: [
                  const Text(
                    "Gender:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userGender,
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User level
              Row(
                children: [
                  const Text(
                    "Level:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userLevel,
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User main goal
              Row(
                children: [
                  const Text(
                    "Main Goal:- ",
                    style: kUserReportTitleTextStyle,
                  ),
                  Text(
                    userMainGoal,
                    style: kUserReportInformationTitleTextStyle,
                  ),
                ],
              ),

              /// User BMI
              BMIScale(
                text1: userBMI.toString(),
                value: userBMI,
                min: 0.0,
                max: 60.0,
                onChanged: (double newWeight) {
                  setState(() {
                    userBMI = userBMI;
                  });
                },
              ),
            ],
          );
        },
      ),
    );
  }
}

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_coach/components/bmi_scale.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/workout_plan_screen/workout_plan_screen.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;
  final _firestore = FirebaseFirestore.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Creating text controllers
  final _heightLogEmailController = TextEditingController();
  final _weightLogEmailController = TextEditingController();

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

  /// Getting color and bmi message according to the user's bmi
  Color bmiColor = kBMIGreenThemeColor;
  String bmiMessage = "NORMAL";

  void getBMIColorAndText(double bmiValue) {
    if (bmiValue < 18.5) {
      bmiColor = kBMIBlueThemeColor;
      bmiMessage = "UNDER WEIGHT";
    } else if (bmiValue >= 18.5 && bmiValue <= 24.9) {
      bmiColor = kBMIGreenThemeColor;
      bmiMessage = "NORMAL";
    } else if (bmiValue >= 25 && bmiValue <= 29.9) {
      bmiColor = kBMIYellowThemeColor;
      bmiMessage = "OVER WEIGHT";
    } else if (bmiValue >= 30 && bmiValue <= 34.9) {
      bmiColor = kBMIOrangeThemeColor;
      bmiMessage = "OBESE";
    } else {
      bmiColor = kBMIRedThemeColor;
      bmiMessage = "EXTREMELY OBESE";
    }
  }

  /// Getting height chart data
  List<_HeightChartData> heightChartData = [];

  Future<void> getHeightChartData() async {
    CollectionReference userHeightChartData = FirebaseFirestore.instance
        .collection('users')
        .doc(loggedInUser.email)
        .collection('height_chart_data');

    QuerySnapshot querySnapshot = await userHeightChartData.get();

    heightChartData.clear();

    for (var doc in querySnapshot.docs) {
      int height = doc['height'];
      setState(() {
        heightChartData.add(_HeightChartData(doc['date'], height));
      });
    }
  }

  /// Height log
  Future<void> updateHeightLog(
      String yearMonthForHeight, int userHeight) async {
    try {
      await _firestore
          .collection("users")
          .doc(loggedInUser.email)
          .collection("height_chart_data")
          .doc(yearMonthForHeight)
          .set({
        'date': yearMonthForHeight,
        'height': userHeight,
      });
    } catch (e) {
      print('Error has occurred: $e');
    }
  }

  /// Clear height log
  Future<void> addDocumentAndDeleteOthersHeight(
      String yearMonthForHeight, int userHeight) async {
    // Get a reference to the collection
    final CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("users")
        .doc(loggedInUser.email)
        .collection("height_chart_data");

    // Get all documents from the collection
    final QuerySnapshot snapshot = await collectionReference.get();

    // Delete each document in the collection
    for (DocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }

    // Add the new document to the collection
    await collectionReference.doc(yearMonthForHeight).set({
      'date': yearMonthForHeight,
      'height': userHeight,
    });
  }

  /// Getting weight chart data
  List<_WeightChartData> weightChartData = [];

  Future<void> getWeightChartData() async {
    CollectionReference userWeightChartData = FirebaseFirestore.instance
        .collection('users')
        .doc(loggedInUser.email)
        .collection('weight_chart_data');

    QuerySnapshot querySnapshot = await userWeightChartData.get();

    weightChartData.clear();

    for (var doc in querySnapshot.docs) {
      int weight = doc['weight'];
      setState(() {
        weightChartData.add(_WeightChartData(doc['date'], weight));
      });
    }
  }

  /// Weight log
  Future<void> updateWeightLog(
      String yearMonthForWeight, int userWeight) async {
    try {
      await _firestore
          .collection("users")
          .doc(loggedInUser.email)
          .collection("weight_chart_data")
          .doc(yearMonthForWeight)
          .set({
        'date': yearMonthForWeight,
        'weight': userWeight,
      });
    } catch (e) {
      print('Error has occurred: $e');
    }
  }

  /// Clear weight log
  Future<void> addDocumentAndDeleteOthersWeight(
      String yearMonthForWeight, int userWeight) async {
    // Get a reference to the collection
    final CollectionReference collectionReference = FirebaseFirestore.instance
        .collection("users")
        .doc(loggedInUser.email)
        .collection("weight_chart_data");

    // Get all documents from the collection
    final QuerySnapshot snapshot = await collectionReference.get();

    // Delete each document in the collection
    for (DocumentSnapshot doc in snapshot.docs) {
      await doc.reference.delete();
    }

    // Add the new document to the collection
    await collectionReference.doc(yearMonthForWeight).set({
      'date': yearMonthForWeight,
      'weight': userWeight,
    });
  }

  @override
  void initState() {
    getLoggedIntUser();
    getHeightChartData();
    getWeightChartData();
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
          int userWeeklyGoal = data["weeklyGoal"];
          Timestamp userBirthDay = data['birthDay'];
          List<dynamic> userFocusedBodyAreas = data["focusedBodyAreas"];

          // Getting the user's age
          int userAge = DateTime.now().year - userBirthDay.toDate().year;

          // Getting the user's BMI value
          double userBMI = double.parse(
              (userWeight / ((userHeight * userHeight) * 0.0001))
                  .toStringAsFixed(2));

          getBMIColorAndText(userBMI);

          final userHeightController = TextEditingController();
          userHeightController.text = userHeight.toString();

          final userWeightController = TextEditingController();
          userWeightController.text = userWeight.toString();

          String year = DateTime.now().year.toString();
          String month = DateTime.now().month.toString();
          String yearMonthForHeight = "$year.$month";
          String yearMonthForWeight = "$year.$month";

          String reps = "";
          String sets = "";

          if (userMainGoal == "Loose Weight") {
            reps = "12-20";
            sets = "2 - 3";
          } else if (userMainGoal == "Build Muscles") {
            reps = "6-12";
            sets = "3-4";
          } else {
            reps = "6-20";
            sets = "2-4";
          }

          return ListView(
            padding: const EdgeInsets.all(kPadding16),
            primary: false,
            children: [
              /// User information
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title
                      const Text(
                        "User Information",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kAppThemeColor,
                        ),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

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

                      /// User height
                      Row(
                        children: [
                          const Text(
                            "Height:- ",
                            style: kUserReportTitleTextStyle,
                          ),
                          Text(
                            "${userHeight.toString()} cm",
                            style: kUserReportInformationTitleTextStyle,
                          ),
                        ],
                      ),

                      /// User weight
                      Row(
                        children: [
                          const Text(
                            "Weight:- ",
                            style: kUserReportTitleTextStyle,
                          ),
                          Text(
                            "${userWeight.toString()} kg",
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
                    ],
                  ),
                ),
              ),

              /// Adding space
              const SizedBox(height: 10.0),

              /// User BMI
              BMIScaleCard(
                text1: userBMI.toString(),
                value: userBMI,
                bmiColor: bmiColor,
                bmiMessage: bmiMessage,
                min: 0.0,
                max: 60.0,
                onChanged: (double userBMI) {
                  setState(() {
                    userBMI = userBMI;
                  });
                },
              ),

              /// Adding space
              const SizedBox(height: 10.0),

              /// User height chart
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title
                      const Text(
                        "Height Chart",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kAppThemeColor,
                        ),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Current user height
                      Row(
                        children: [
                          const Text(
                            "Current Height:- ",
                            style: kUserReportTitleTextStyle,
                          ),
                          Text(
                            "${userHeight.toString()} cm",
                            style: kUserReportInformationTitleTextStyle,
                          ),
                        ],
                      ),

                      /// Chart
                      SfCartesianChart(
                        margin: EdgeInsets.zero,
                        primaryXAxis: const CategoryAxis(),
                        // Enable legend
                        legend: const Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<_HeightChartData, String>>[
                          LineSeries<_HeightChartData, String>(
                              dataSource: heightChartData,
                              color: kAppThemeColor,
                              xValueMapper: (_HeightChartData height, _) =>
                                  height.date,
                              yValueMapper: (_HeightChartData height, _) =>
                                  height.height,
                              name: 'Height (cm)',
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ],
                      ),

                      /// Clear and Add buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Clear height log
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: kRedThemeColor,
                                    icon: const Icon(
                                      Icons.warning_rounded,
                                      color: kWhiteThemeColor,
                                    ),
                                    title: const Text(
                                      "Are you sure?",
                                      style: TextStyle(color: kWhiteThemeColor),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "If you clear your height log, all height data will be deleted! If you want to continue, enter your email to confirm!",
                                          style: TextStyle(
                                              color: kWhiteThemeColor),
                                        ),
                                        TextFormField(
                                          controller: _heightLogEmailController,
                                          style: const TextStyle(
                                              color: kWhiteThemeColor),
                                          cursorColor: kWhiteThemeColor,
                                          decoration:
                                              kMlwfTextFormFieldDecorations,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      /// Cancel button
                                      ElevatedButton(
                                        onPressed: () {
                                          _heightLogEmailController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Cancel",
                                          style:
                                              TextStyle(color: kRedThemeColor),
                                        ),
                                      ),

                                      /// Continue button
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (_heightLogEmailController.text
                                                  .trim() ==
                                              loggedInUser.email) {
                                            Navigator.pop(context);
                                            await addDocumentAndDeleteOthersHeight(
                                                yearMonthForHeight, userHeight);
                                            await getHeightChartData();
                                            _heightLogEmailController.clear();
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Wrong email!"),
                                                  content: const Text(
                                                      "The email entered doesn't match with your email address. Check back and try again!"),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          "Try again"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "Continue",
                                          style:
                                              TextStyle(color: kRedThemeColor),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kRedThemeColor),
                            child: const Text(
                              "Clear Height Log",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                          ),

                          /// Adding space
                          const SizedBox(width: 8.0),

                          /// Add height log
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Add height log"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        /// Date picker
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now(),
                                            );
                                            if (picked != null) {
                                              String year =
                                                  picked.year.toString();
                                              String month =
                                                  picked.month.toString();
                                              yearMonthForHeight =
                                                  "$year.$month";
                                            }
                                          },
                                          icon: const Icon(
                                              Icons.calendar_month_rounded),
                                          label: const Text("Select Date"),
                                        ),

                                        /// Height picker
                                        TextFormField(
                                          controller: userHeightController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter your height",
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      /// Cancel button
                                      ElevatedButton(
                                          onPressed: () {
                                            userHeightController.text =
                                                userHeight.toString();
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel")),

                                      /// Save button
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateHeightLog(
                                              yearMonthForHeight,
                                              userHeightController.text
                                                      .trim()
                                                      .isNotEmpty
                                                  ? int.parse(
                                                      userHeightController.text
                                                          .trim())
                                                  : userHeight);
                                          await getHeightChartData();
                                          if (!context.mounted) return;
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kAppThemeColor),
                            child: const Text(
                              "Add Height Log",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Adding space
              const SizedBox(height: 10.0),

              /// User weight chart
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title
                      const Text(
                        "Weight Chart",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kAppThemeColor,
                        ),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Current user weight
                      Row(
                        children: [
                          const Text(
                            "Current Weight:- ",
                            style: kUserReportTitleTextStyle,
                          ),
                          Text(
                            "${userWeight.toString()} kg",
                            style: kUserReportInformationTitleTextStyle,
                          ),
                        ],
                      ),

                      /// Chart
                      SfCartesianChart(
                        margin: EdgeInsets.zero,
                        primaryXAxis: const CategoryAxis(),
                        // Enable legend
                        legend: const Legend(isVisible: true),
                        // Enable tooltip
                        tooltipBehavior: TooltipBehavior(enable: true),
                        series: <CartesianSeries<_WeightChartData, String>>[
                          LineSeries<_WeightChartData, String>(
                              dataSource: weightChartData,
                              color: kAppThemeColor,
                              xValueMapper: (_WeightChartData weight, _) =>
                                  weight.date,
                              yValueMapper: (_WeightChartData weight, _) =>
                                  weight.weight,
                              name: 'Weight (kg)',
                              // Enable data label
                              dataLabelSettings:
                                  const DataLabelSettings(isVisible: true))
                        ],
                      ),

                      /// Clear and Add buttons row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          /// Clear weight log
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    backgroundColor: kRedThemeColor,
                                    icon: const Icon(
                                      Icons.warning_rounded,
                                      color: kWhiteThemeColor,
                                    ),
                                    title: const Text(
                                      "Are you sure?",
                                      style: TextStyle(color: kWhiteThemeColor),
                                    ),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        const Text(
                                          "If you clear your weight log, all weight data will be deleted! If you want to continue, enter your email to confirm!",
                                          style: TextStyle(
                                              color: kWhiteThemeColor),
                                        ),
                                        TextFormField(
                                          controller: _weightLogEmailController,
                                          style: const TextStyle(
                                              color: kWhiteThemeColor),
                                          cursorColor: kWhiteThemeColor,
                                          decoration:
                                              kMlwfTextFormFieldDecorations,
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      /// Cancel button
                                      ElevatedButton(
                                        onPressed: () {
                                          _weightLogEmailController.clear();
                                          Navigator.pop(context);
                                        },
                                        child: const Text(
                                          "Cancel",
                                          style:
                                              TextStyle(color: kRedThemeColor),
                                        ),
                                      ),

                                      /// Continue button
                                      ElevatedButton(
                                        onPressed: () async {
                                          if (_weightLogEmailController.text
                                                  .trim() ==
                                              loggedInUser.email) {
                                            Navigator.pop(context);
                                            await addDocumentAndDeleteOthersWeight(
                                                yearMonthForWeight, userWeight);
                                            await getWeightChartData();
                                            _weightLogEmailController.clear();
                                          } else {
                                            showDialog(
                                              context: context,
                                              builder: (context) {
                                                return AlertDialog(
                                                  title: const Text(
                                                      "Wrong email!"),
                                                  content: const Text(
                                                      "The email entered doesn't match with your email address. Check back and try again!"),
                                                  actions: [
                                                    ElevatedButton(
                                                      onPressed: () {
                                                        Navigator.pop(context);
                                                      },
                                                      child: const Text(
                                                          "Try again"),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }
                                        },
                                        child: const Text(
                                          "Continue",
                                          style:
                                              TextStyle(color: kRedThemeColor),
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kRedThemeColor),
                            child: const Text(
                              "Clear Weight Log",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                          ),

                          /// Adding space
                          const SizedBox(width: 8.0),

                          /// Add weight log
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Add weight log"),
                                    content: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        /// Date picker
                                        ElevatedButton.icon(
                                          onPressed: () async {
                                            final DateTime? picked =
                                                await showDatePicker(
                                              context: context,
                                              initialDate: DateTime.now(),
                                              firstDate: DateTime(1900),
                                              lastDate: DateTime.now(),
                                            );
                                            if (picked != null) {
                                              String year =
                                                  picked.year.toString();
                                              String month =
                                                  picked.month.toString();
                                              yearMonthForWeight =
                                                  "$year.$month";
                                            }
                                          },
                                          icon: const Icon(
                                              Icons.calendar_month_rounded),
                                          label: const Text("Select Date"),
                                        ),

                                        /// Weight picker
                                        TextFormField(
                                          controller: userWeightController,
                                          decoration: const InputDecoration(
                                            hintText: "Enter your weight",
                                          ),
                                          keyboardType: TextInputType.number,
                                          inputFormatters: [
                                            FilteringTextInputFormatter
                                                .digitsOnly,
                                          ],
                                        ),
                                      ],
                                    ),
                                    actions: [
                                      /// Cancel button
                                      ElevatedButton(
                                          onPressed: () {
                                            userWeightController.text =
                                                userWeight.toString();
                                            Navigator.pop(context);
                                          },
                                          child: const Text("Cancel")),

                                      /// Save button
                                      ElevatedButton(
                                        onPressed: () async {
                                          await updateWeightLog(
                                              yearMonthForWeight,
                                              userWeightController.text
                                                      .trim()
                                                      .isNotEmpty
                                                  ? int.parse(
                                                      userWeightController.text
                                                          .trim())
                                                  : userWeight);
                                          await getWeightChartData();
                                          if (!context.mounted) return;
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kAppThemeColor),
                            child: const Text(
                              "Add Weight Log",
                              style: TextStyle(color: kWhiteThemeColor),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

              /// Adding space
              const SizedBox(height: 10.0),

              /// User ongoing Workout Plan
              Card(
                margin: EdgeInsets.zero,
                shape: const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: const EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title
                      const Text(
                        "Ongoing Workout Plan",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kAppThemeColor,
                        ),
                      ),

                      /// Adding space
                      const SizedBox(height: 8.0),

                      /// Show workout plan button
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              /// Workout plan
                              return Card(
                                margin: EdgeInsets.zero,
                                shape: const RoundedRectangleBorder(
                                    borderRadius: BorderRadius.all(
                                        Radius.circular(kRadius16))),
                                child: Padding(
                                  padding: const EdgeInsets.all(kPadding8),
                                  child: Column(
                                    children: [
                                      /// Title Workout Plan
                                      const Text(
                                        "Workout Plan",
                                        style: kLargeBlackTitleTextStyle,
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 12.0),

                                      /// Instructions
                                      const Text(
                                        "Instructions",
                                        style: TextStyle(
                                            fontSize: 22.0,
                                            fontWeight: FontWeight.w700),
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 8.0),

                                      /// Main Goal
                                      const Text(
                                        "Main Goal",
                                        style: kProfileTitleTextStyle,
                                      ),
                                      Text(
                                        "Your main goal is to $userMainGoal, so aim for $sets sets of $reps reps per exercise.",
                                        textAlign: TextAlign.center,
                                        style:
                                            kSmallGreyColorDescriptionTextStyle
                                                .copyWith(
                                                    color: kBlackThemeColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 8.0),

                                      /// Weekly goal
                                      const Text(
                                        "Weekly Goal",
                                        style: kProfileTitleTextStyle,
                                      ),
                                      Text(
                                        "Your weekly goal is to perform all the exercises listed within $userWeeklyGoal days of the week.",
                                        textAlign: TextAlign.center,
                                        style:
                                            kSmallGreyColorDescriptionTextStyle
                                                .copyWith(
                                                    color: kBlackThemeColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 8.0),

                                      /// Focused body areas
                                      const Text(
                                        "Focused Body Areas",
                                        style: kProfileTitleTextStyle,
                                      ),
                                      Text(
                                        userFocusedBodyAreas
                                            .toString()
                                            .split("[")
                                            .last
                                            .split("]")
                                            .first,
                                        textAlign: TextAlign.center,
                                        style:
                                            kSmallGreyColorDescriptionTextStyle
                                                .copyWith(
                                                    color: kBlackThemeColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 8.0),

                                      /// Equipments
                                      const Text(
                                        "Equipments",
                                        style: kProfileTitleTextStyle,
                                      ),
                                      Text(
                                        "For optimum results, we recommend using Kettlebells or Dumbbells for weighted exercises.",
                                        textAlign: TextAlign.center,
                                        style:
                                            kSmallGreyColorDescriptionTextStyle
                                                .copyWith(
                                                    color: kBlackThemeColor,
                                                    fontWeight:
                                                        FontWeight.w400),
                                      ),

                                      /// Adding space
                                      const SizedBox(height: 8.0),

                                      /// Exercises
                                      Text(
                                        "Exercises - $userLevel Level",
                                        style: kProfileTitleTextStyle,
                                      ),

                                      /// Show exercises button
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  WorkoutPlanScreenScreen(
                                                focusedBodyAreas:
                                                    userFocusedBodyAreas,
                                                loggedInUserEmail:
                                                    loggedInUser.email,
                                              ),
                                            ),
                                          );
                                        },
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: kAppThemeColor),
                                        child: Text(
                                          "Show Exercises",
                                          style:
                                              kSmallGreyColorDescriptionTextStyle
                                                  .copyWith(
                                                      color: kWhiteThemeColor),
                                        ),
                                      ),

                                      /// Adding space
                                      const Spacer(),

                                      /// Back button
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Back"),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          );
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: kAppThemeColor),
                        child: Text(
                          "Show Workout Plan",
                          style: kSmallGreyColorDescriptionTextStyle.copyWith(
                              color: kWhiteThemeColor),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              /// Adding space
              const SizedBox(height: 10.0),

              /// User history
              const Card(
                margin: EdgeInsets.zero,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
                child: Padding(
                  padding: EdgeInsets.all(kPadding8),
                  child: Column(
                    children: [
                      /// Title
                      Text(
                        "History",
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.w700,
                          color: kAppThemeColor,
                        ),
                      ),

                      /// Adding space
                      SizedBox(height: 8.0),

                      Text(
                        "Not yet finished any workout plan...",
                        style: kUserReportTitleTextStyle,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class _HeightChartData {
  _HeightChartData(this.date, this.height);

  final String date;
  final int height;
}

class _WeightChartData {
  _WeightChartData(this.date, this.weight);

  final String date;
  final int weight;
}

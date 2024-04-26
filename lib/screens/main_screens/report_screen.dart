import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_coach/components/bmi_scale.dart';
import 'package:smart_personal_coach/constants.dart';
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

    for (var doc in querySnapshot.docs) {
      int height = doc['height'];
      setState(() {
        heightChartData.add(_HeightChartData(doc['date'], height.toDouble()));
      });
    }
  }

  /// Height log
  Future<void> updateHeightLog(String yearMonthForHeight, int height) async {
    try {
      await _firestore
          .collection("users")
          .doc(loggedInUser.email)
          .collection("height_chart_data")
          .doc(yearMonthForHeight)
          .set({
        'date': yearMonthForHeight,
        'height': height,
      });
    } catch (e) {
      print('Error has occurred: $e');
    }
  }

  @override
  void initState() {
    getLoggedIntUser();
    getHeightChartData();
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

          getBMIColorAndText(userBMI);

          final userHeightController = TextEditingController();
          userHeightController.text = userHeight.toString();

          String year = DateTime.now().year.toString();
          String month = DateTime.now().month.toString();
          String yearMonthForHeight = "$year.$month";

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

              /// Height chart
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

                      /// Height chart
                      SfCartesianChart(
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

                      /// Height log
                      ElevatedButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text("Height Log"),
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
                                          String year = picked.year.toString();
                                          String month =
                                              picked.month.toString();
                                          yearMonthForHeight = "$year.$month";
                                        }
                                      },
                                      icon: const Icon(
                                          Icons.calendar_month_rounded),
                                      label: const Text("Date"),
                                    ),

                                    /// Height picker
                                    TextFormField(
                                      controller: userHeightController,
                                      decoration: const InputDecoration(
                                        hintText: "Enter your height",
                                      ),
                                      keyboardType: TextInputType.number,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.digitsOnly,
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
                                              ? int.parse(userHeightController
                                                  .text
                                                  .trim())
                                              : userHeight);
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
                        child: const Text("Height Log"),
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
  final double height;
}

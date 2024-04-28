import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

const kW500 = TextStyle(fontWeight: FontWeight.w500);
const kFSFCW500 = TextStyle(
  fontSize: 15,
  color: kAppThemeColor,
  fontWeight: FontWeight.w500,
);

class DietPlanScreen extends StatefulWidget {
  const DietPlanScreen({super.key, required this.userWeight});

  final int userWeight;

  @override
  State<DietPlanScreen> createState() => _DietPlanScreenState();
}

class _DietPlanScreenState extends State<DietPlanScreen> {
  double gramsOfCarbs = 0.0;
  double gramsOfProtein = 0.0;
  double gramsOfFat = 0.0;
  double totalCalories = 0.0;

  void getUserGramsOfCarbsProteinFat() {
    gramsOfCarbs = widget.userWeight * 2;
    gramsOfProtein = widget.userWeight * 2;
    gramsOfFat = widget.userWeight / 2;
    totalCalories =
        ((gramsOfCarbs * 4) + (gramsOfProtein * 4) + (gramsOfFat * 9));
  }

  @override
  void initState() {
    getUserGramsOfCarbsProteinFat();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Diet Plan",
          style: kAppBarTextStyle,
        ),
        iconTheme: const IconThemeData(color: kWhiteThemeColor),
      ),
      body: ListView(
        padding: const EdgeInsets.all(kPadding16),
        primary: false,
        children: [
          /// Introduction
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
                    "Introduction",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kAppThemeColor,
                    ),
                  ),
                  const Text(
                    "Here we teach you how to create a diet plan according to your needs."
                    " You can follow these instructions to do it.",
                    textAlign: TextAlign.center,
                    style: kW500,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Calories in each ingredient",
                        style: kFSFCW500),
                  ),
                  const Text("Carbohydrates(1gram) → 4 Calories", style: kW500),
                  const Text("Protein(1gram) → 4 Calories", style: kW500),
                  const Text("Fat(1gram) → 9 Calories", style: kW500),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● For 1kg of body weight",
                        style: kFSFCW500),
                  ),
                  const Text("Carbohydrates → 1.5 grams or 2 grams",
                      style: kW500),
                  const Text("Protein → 1.5 grams or 2 grams", style: kW500),
                  const Text("Fat → 50% of body weight", style: kW500),
                ],
              ),
            ),
          ),

          /// Adding space
          const SizedBox(height: 10.0),

          /// Calories Required for the user for one meal
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
                    "Calories Required for One Meal for You",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kAppThemeColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                      "Carbohydrates → ${widget.userWeight} x 2 = $gramsOfCarbs grams",
                      style: kW500),
                  Text(
                      "Protein → ${widget.userWeight} x 2 = $gramsOfProtein grams",
                      style: kW500),
                  Text("Fat → ${widget.userWeight} / 2 = $gramsOfFat grams",
                      style: kW500),
                  Text("Total calories for one meal → $totalCalories Calories",
                      style: kW500),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

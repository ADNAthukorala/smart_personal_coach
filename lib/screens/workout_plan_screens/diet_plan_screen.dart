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
                    child: const Text("● Calories In Each Ingredient",
                        style: kFSFCW500),
                  ),
                  const Text("Carbohydrates (1 gram) → 4 calories",
                      style: kW500),
                  const Text("Protein (1 gram) → 4 calories", style: kW500),
                  const Text("Fat (1 gram) → 9 calories", style: kW500),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● For 1kg of Body Weight",
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
                    "Your Body Weight = ${widget.userWeight} kg",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: kBlackThemeColor,
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
                  Text("Total calories for one meal → $totalCalories calories",
                      style: kW500),
                ],
              ),
            ),
          ),

          /// Adding space
          const SizedBox(height: 10.0),

          /// User's diet plan
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
                    "Your Diet Plan",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kAppThemeColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Breakfast (1st Meal) - 8.00 AM",
                        style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("6 white eggs with one whole egg",
                                style: kW500),
                            Text("Dry oats - 80 grams", style: kW500),
                            Text("Peanut butter - 2 tablespoon", style: kW500),
                            Text("Almond seeds - 10 seeds", style: kW500),
                            Text("Strawberry / Banana", style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Adding space
                  const SizedBox(height: 8.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text(
                        "● Mid Morning Snack (2nd Meal) - 10.30 AM",
                        style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Tuna fish - 200 grams", style: kW500),
                            Text("Rice white/brown - 200 grams", style: kW500),
                            Text("Green salad / Boiled vegetables",
                                style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Adding space
                  const SizedBox(height: 8.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Lunch (3rd Meal) - 1.30 PM",
                        style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Fish/Beef/Chicken - 200 grams", style: kW500),
                            Text("Rice/Pasta - 200 grams", style: kW500),
                            Text("Green salad / Boiled vegetables",
                                style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Adding space
                  const SizedBox(height: 8.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● After Lunch (4th Meal) - 4.30 PM",
                        style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chicken - 150 grams", style: kW500),
                            Text("Potato - 100 grams", style: kW500),
                            Text("Green salad", style: kW500),
                            Text("One Banana", style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),

                  /// Adding space
                  const SizedBox(height: 8.0),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Dinner (5th Meal) - 8.30 PM",
                        style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Beef/Fish/Eggs/Chicken - 150 grams",
                                style: kW500),
                            Text("Sweet Potato / Rice - 100 grams",
                                style: kW500),
                            Text("Green salad / Boiled vegetables",
                                style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// Adding space
          const SizedBox(height: 10.0),

          /// Example Foods
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
                    "Example Foods",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                      color: kAppThemeColor,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Carbohydrates", style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Rice", style: kW500),
                            Text("Oats", style: kW500),
                            Text("Potato", style: kW500),
                            Text("Whole grain foods", style: kW500),
                            Text("Whole grain breads", style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Protein", style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Chicken breast", style: kW500),
                            Text("Eggs", style: kW500),
                            Text("Beef", style: kW500),
                            Text("Turkey breast", style: kW500),
                            Text("Fish (Tuna fish)", style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Text("● Fat", style: kFSFCW500),
                  ),
                  Container(
                    alignment: Alignment.centerLeft,
                    child: const Row(
                      children: [
                        SizedBox(width: 30.0),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Avocado", style: kW500),
                            Text("Almond seeds/oil", style: kW500),
                            Text("Dry nuts", style: kW500),
                            Text("Olive oil", style: kW500),
                            Text("Coconut oil", style: kW500),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

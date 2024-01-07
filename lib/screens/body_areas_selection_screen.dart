import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

enum BodyArea { arms, back, chest, abs, legs }

class FullBodyScreen extends StatefulWidget {
  const FullBodyScreen({super.key});

  @override
  State<FullBodyScreen> createState() => _FullBodyScreenState();
}

class _FullBodyScreenState extends State<FullBodyScreen> {
  // Declare a list to store selected body areas.
  List<BodyArea> bodyAreas = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      // Add padding around the main column
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        // The main column
        child: Column(
          children: [
            // Topic
            const Text(
              'Please choose your focus area',
              style: kLargeTextStyle,
              textAlign: TextAlign.center,
            ),
            // Add a Spacer between the topic and the body area selection
            const Spacer(),
            // Body area selection
            SizedBox(
              // Add height to the container for stable purposes
              height: 496.0,
              // Button bar and body image holder row
              child: Row(
                // Center button bar and image inside the row
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Flexible button bar
                  Flexible(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        // Select the full body button
                        SelectBodyAreaButton(
                          array: bodyAreas,
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array length >= 5
                              if (bodyAreas.length >= 5) {
                                // If it is true, the bodyAreas array should be empty when this button is clicked
                                bodyAreas.clear();
                              } else {
                                // If it false, these body areas should be added to the array
                                bodyAreas.clear();
                                bodyAreas.add(BodyArea.arms);
                                bodyAreas.add(BodyArea.back);
                                bodyAreas.add(BodyArea.chest);
                                bodyAreas.add(BodyArea.abs);
                                bodyAreas.add(BodyArea.legs);
                              }
                              // print(bodyAreas);
                            });
                          },
                          buttonLabel: 'Full Body',
                        ),
                        // Select arms button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains arms
                              if (bodyAreas.contains(BodyArea.arms)) {
                                // If it is true, remove arms from the array when this button is clicked
                                bodyAreas.remove(BodyArea.arms);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                bodyAreas.add(BodyArea.arms);
                              }
                              // print(bodyAreas);
                            });
                          },
                          array: bodyAreas,
                          buttonLabel: 'Arms',
                          selectedBodyArea: BodyArea.arms,
                        ),
                        // Select back button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains back
                              if (bodyAreas.contains(BodyArea.back)) {
                                // If it is true, remove back from the array when this button is clicked
                                bodyAreas.remove(BodyArea.back);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                bodyAreas.add(BodyArea.back);
                              }
                              // print(bodyAreas);
                            });
                          },
                          array: bodyAreas,
                          buttonLabel: 'Back',
                          selectedBodyArea: BodyArea.back,
                        ),
                        // Select chest button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains chest
                              if (bodyAreas.contains(BodyArea.chest)) {
                                // If it is true, remove chest from the array when this button is clicked
                                bodyAreas.remove(BodyArea.chest);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                bodyAreas.add(BodyArea.chest);
                              }
                              // print(bodyAreas);
                            });
                          },
                          array: bodyAreas,
                          buttonLabel: 'Chest',
                          selectedBodyArea: BodyArea.chest,
                        ),
                        // Select abs button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains abs
                              if (bodyAreas.contains(BodyArea.abs)) {
                                // If it is true, remove abs from the array when this button is clicked
                                bodyAreas.remove(BodyArea.abs);
                              } else {
                                // If it false, add arms to the array when this button is clicked
                                bodyAreas.add(BodyArea.abs);
                              }
                              // print(bodyAreas);
                            });
                          },
                          array: bodyAreas,
                          buttonLabel: 'Abs',
                          selectedBodyArea: BodyArea.abs,
                        ),
                        // Select legs button
                        SelectBodyAreaButton(
                          onPressed: () {
                            setState(() {
                              // Check whether bodyAreas array contains legs
                              if (bodyAreas.contains(BodyArea.legs)) {
                                // If it is true, remove legs from array when this button is clicked
                                bodyAreas.remove(BodyArea.legs);
                              } else {
                                // If it false, add legs to the array when this button is clicked
                                bodyAreas.add(BodyArea.legs);
                              }
                              // print(bodyAreas);
                            });
                          },
                          array: bodyAreas,
                          buttonLabel: 'Legs',
                          selectedBodyArea: BodyArea.legs,
                        ),
                      ],
                    ),
                  ),
                  // Full body image
                  Image.asset(
                    'images/full_body_image.png',
                    height: 496,
                    width: 243,
                  ),
                ],
              ),
            ),
            // Add spacer between the body area selection and the next button
            const Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FullBodyScreen(),
                  ),
                );
              },
              style: kNextButtonStyle,
              child: const Text(
                'Next',
                style: kNextButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Button to select body areas
class SelectBodyAreaButton extends StatelessWidget {
  const SelectBodyAreaButton({
    super.key,
    required this.array,
    this.selectedBodyArea,
    required this.onPressed,
    required this.buttonLabel,
  });

  final List<BodyArea> array;
  final BodyArea? selectedBodyArea;
  final String buttonLabel;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: kSelectBodyAreaButtonStyle.copyWith(
        backgroundColor: array.contains(selectedBodyArea) || array.length == 5
            ? const MaterialStatePropertyAll(kBlueThemeColor)
            : const MaterialStatePropertyAll(kWhiteThemeColor),
      ),
      child: Text(
        buttonLabel,
        style: kSelectBodyAreaButtonTextStyle.copyWith(
          color: array.contains(selectedBodyArea) || array.length == 5
              ? kWhiteThemeColor
              : kBlackThemeColor,
        ),
      ),
    );
  }
}

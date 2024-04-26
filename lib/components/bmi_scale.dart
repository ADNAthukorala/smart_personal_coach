import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class BMIScaleCard extends StatelessWidget {
  const BMIScaleCard(
      {super.key,
      required this.text1,
      required this.value,
      required this.min,
      required this.max,
      required this.onChanged,
      required this.bmiColor,
      required this.bmiMessage});

  final String text1;
  final double value;
  final double min;
  final double max;
  final Color bmiColor;
  final String bmiMessage;
  final void Function(double)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(kRadius16))),
      child: Padding(
        padding: const EdgeInsets.all(kPadding8),
        child: Column(
          children: [
            const Text(
              "Body Mass Index (BMI)",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: kAppThemeColor,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.baseline,
              textBaseline: TextBaseline.alphabetic,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w700,
                    color: bmiColor,
                  ),
                ),
                Text(
                  "kg/m\u00B2",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: bmiColor,
                  ),
                ),
              ],
            ),
            Text(
              bmiMessage,
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w700,
                color: bmiColor,
              ),
            ),
            SliderTheme(
              data: kBMISliderStyle.copyWith(activeTrackColor: bmiColor),
              child: Slider(
                value: value,
                min: min,
                max: max,
                onChanged: onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

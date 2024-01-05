import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class AgeHeightWeightScreen extends StatefulWidget {
  const AgeHeightWeightScreen({super.key});

  @override
  State<AgeHeightWeightScreen> createState() => _AgeHeightWeightScreenState();
}

class _AgeHeightWeightScreenState extends State<AgeHeightWeightScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ADNA'),
        backgroundColor: kBlueThemeColor,
      ),
      body: Padding(
        //Adding padding to screen
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            //Top texts column of bottom area
            const Column(
              children: [
                Text(
                  'Let us known you better',
                  style: kLargeTextStyle,
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Let us know you better to help boost your workout results',
                  style: kSmallTextStyle,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            //User's data getting card
            Card(
              color: kBlueThemeColor,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Age',
                          style: kLargeTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: [
                            Text(
                              '22',
                              style: kLargeTextStyle.copyWith(color: kWhiteThemeColor),
                            ),
                            Text(
                              'years',
                              style: kSmallTextStyle.copyWith(color: kWhiteThemeColor),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Slider(
                      value: 100.0,
                      min: 60.0,
                      max: 280.0,
                      onChanged: (value) {

                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

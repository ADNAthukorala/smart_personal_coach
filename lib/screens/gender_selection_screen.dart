import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/components.dart';

class GenderSelectionScreen extends StatefulWidget {
  const GenderSelectionScreen({super.key});

  @override
  State<GenderSelectionScreen> createState() => _GenderSelectionScreenState();
}

class _GenderSelectionScreenState extends State<GenderSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const Flexible(
            flex: 1,
            child: TopImage(
              imageUrl: 'images/gender_selection_screen_image.jpg',
            ),
          ),
          Flexible(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(16.0, 8.0, 16.0, 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "What's your gender?",
                    style: kLargeTextStyle,
                  ),
                  const SizedBox(height: 8.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      ElevatedButton(
                        onPressed: () {},
                        style: kRoundedCornerButtonStyle.copyWith(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150.0, 70.0)),
                          backgroundColor:
                              const MaterialStatePropertyAll(kWhiteThemeColor),
                        ),
                        child: Text(
                          'Male',
                          style:
                              kLargeTextStyle.copyWith(color: kBlackThemeColor),
                        ),
                      ),
                      ElevatedButton(
                        onPressed: () {},
                        style: kRoundedCornerButtonStyle.copyWith(
                          fixedSize:
                              const MaterialStatePropertyAll(Size(150.0, 70.0)),
                          backgroundColor:
                              const MaterialStatePropertyAll(kWhiteThemeColor),
                        ),
                        child: Text(
                          'Female',
                          style:
                              kLargeTextStyle.copyWith(color: kBlackThemeColor),
                        ),
                      ),
                    ],
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    style: kRoundedCornerButtonStyle.copyWith(
                      fixedSize:
                          const MaterialStatePropertyAll(Size(104.0, 46.0)),
                    ),
                    child: const Text(
                      'Go',
                      style: TextStyle(
                        fontFamily: kThemeFontFamily,
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: kWhiteThemeColor,
                      ),
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

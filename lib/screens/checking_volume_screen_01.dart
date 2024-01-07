import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class CheckingVolumeScreen01 extends StatefulWidget {
  const CheckingVolumeScreen01({super.key});

  @override
  State<CheckingVolumeScreen01> createState() => _CheckingVolumeScreen01State();
}

class _CheckingVolumeScreen01State extends State<CheckingVolumeScreen01> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        // Add padding around the main column
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Topic
            const Text(
              'How many push-ups can you do?',
              style: kLargeTextStyle,
              textAlign: TextAlign.center,
            ),
            Column(
              children: [
                ElevatedButton(
                  onPressed: () {

                  },
                  style: const ButtonStyle(
                    fixedSize: MaterialStatePropertyAll(Size(double.maxFinite, 100.0)),
                    backgroundColor: MaterialStatePropertyAll(kWhiteThemeColor),
                    shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(16),
                          topRight: Radius.circular(8),
                          bottomRight: Radius.circular(16),
                          bottomLeft: Radius.circular(8)),
                    )),
                  ),
                  child: const Text(
                    '0 - 5',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w900,
                      color: kBlackThemeColor,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/components/terms_and_conditions.dart';

class TermsAndConditionsScreen extends StatefulWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  State<TermsAndConditionsScreen> createState() =>
      _TermsAndConditionsScreenState();
}

class _TermsAndConditionsScreenState extends State<TermsAndConditionsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Terms & Conditions',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(kPadding16),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: const [
                  Text(
                    lastUpdateTitle,
                    style: kTermsAndConditionsTitlesTextStyle,
                  ),
                  Text(
                    lastUpdateDescription,
                    style: kTermsAndConditionsDescriptionsTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    acceptanceOfTermsTitle,
                    style: kTermsAndConditionsTitlesTextStyle,
                  ),
                  Text(
                    acceptanceOfTermsDescription,
                    style: kTermsAndConditionsDescriptionsTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    userAccountsTitle,
                    style: kTermsAndConditionsTitlesTextStyle,
                  ),
                  Text(
                    userAccountsDescription,
                    style: kTermsAndConditionsDescriptionsTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    agreementToTermsTitle,
                    style: kTermsAndConditionsTitlesTextStyle,
                  ),
                  Text(
                    agreementToTermsDescription,
                    style: kTermsAndConditionsDescriptionsTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Text(
                    bottom,
                    style: kTermsAndConditionsDescriptionsTextStyle,
                  ),
                  SizedBox(height: 16.0),
                  Center(
                    child: Text(
                      'ADNA',
                      style: kTermsAndConditionsTitlesTextStyle,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 8.0),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              style: kNextButtonStyle,
              child: const Text(
                'Go Back',
                style: kNextButtonTextStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

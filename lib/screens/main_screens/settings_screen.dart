import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'SETTINGS',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            color: kBlueThemeColor,
          ),
        ),
      ),
      body: const Center(
        child: Text('Settings'),
      ),
    );
  }
}

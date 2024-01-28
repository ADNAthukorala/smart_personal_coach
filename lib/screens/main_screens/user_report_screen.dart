import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class UserReportScreen extends StatefulWidget {
  const UserReportScreen({super.key});

  @override
  State<UserReportScreen> createState() => _UserReportScreenState();
}

class _UserReportScreenState extends State<UserReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'USER REPORT',
          style: kMainScreensAppBarTextStyle,
        ),
      ),
      body: const Center(
        child: Text('User Report'),
      ),
    );
  }
}

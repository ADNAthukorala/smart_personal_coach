import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';

class ReportScreen extends StatefulWidget {
  const ReportScreen({super.key});

  @override
  State<ReportScreen> createState() => _ReportScreenState();
}

class _ReportScreenState extends State<ReportScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'REPORT',
          style: kAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Report'),
      ),
    );
  }
}

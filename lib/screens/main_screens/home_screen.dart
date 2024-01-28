import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'HOME',
          style: kMainScreensAppBarTextStyle,
        ),
        automaticallyImplyLeading: false,
      ),
      body: const Center(
        child: Text('Home'),
      ),
    );
  }
}

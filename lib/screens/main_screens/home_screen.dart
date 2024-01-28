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
      body: Padding(
        padding: const EdgeInsets.only(
          top: kPadding8,
          right: kPadding16,
          bottom: kPadding8,
          left: kPadding16,
        ),
        child: Expanded(
          child: ListView(
            children: [
              Expanded(
                child: Card(
                  child: SizedBox(
                      height: 200.0, child: Center(child: Text('Card 1'))),
                ),
              ),
              Expanded(
                child: Card(
                  child: SizedBox(
                      height: 200.0, child: Center(child: Text('Card 2'))),
                ),
              ),
              Expanded(
                child: Card(
                  child: SizedBox(
                      height: 200.0, child: Center(child: Text('Card 3'))),
                ),
              ),
              Expanded(
                child: Card(
                  child: SizedBox(
                      height: 200.0, child: Center(child: Text('Card 4'))),
                ),
              ),
              Expanded(
                child: Card(
                  child: SizedBox(
                      height: 200.0, child: Center(child: Text('Card 5'))),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

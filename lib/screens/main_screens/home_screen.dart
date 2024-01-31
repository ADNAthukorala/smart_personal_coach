import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/screens/exercises_screen.dart';

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
          style: kAppBarTextStyle,
        ),
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: kBlueThemeColor,
              ),
              child: Text(
                'Smart Personal Coach',
                style: kDrawerHeaderTextStyle,
              ),
            ),
            ListTile(
              leading: const Icon(Icons.fitness_center),
              title: const Text(
                'Exercises',
                style: kDrawerItemTextStyle,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                    const ExercisesScreen(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.only(
          top: kPadding8,
          right: kPadding16,
          bottom: kPadding8,
          left: kPadding16,
        ),
        child: Center(child: Text('Home')),
      ),
    );
  }
}

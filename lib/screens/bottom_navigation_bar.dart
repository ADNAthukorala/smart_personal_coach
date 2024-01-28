import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/screens/main_screens/global_chat_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/home_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/settings_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/user_report_screen.dart';

class BottomNavigationBarScreen extends StatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  State<BottomNavigationBarScreen> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState extends State<BottomNavigationBarScreen> {
  int _currentScreenIndex = 0;

  final List<Widget> _screens = [
    const HomeScreen(),
    const GlobalChatScreen(),
    const UserReportScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _screens[_currentScreenIndex],
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
        indicatorColor: Colors.transparent,
        selectedIndex: _currentScreenIndex,
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
        destinations: [
          NavigationDestination(
            icon: Icon(
              size: 30.0,
              Icons.home_rounded,
              color:
                  _currentScreenIndex == 0 ? kBlueThemeColor : kGreyThemeColor,
            ),
            label: 'Home',
          ),
          NavigationDestination(
            icon: Icon(
              size: 30.0,
              Icons.travel_explore_rounded,
              color:
                  _currentScreenIndex == 1 ? kBlueThemeColor : kGreyThemeColor,
            ),
            label: 'Global Chat',
          ),
          NavigationDestination(
            icon: Icon(
              size: 30.0,
              Icons.bar_chart_rounded,
              color:
                  _currentScreenIndex == 2 ? kBlueThemeColor : kGreyThemeColor,
            ),
            label: 'Report',
          ),
          NavigationDestination(
            icon: Icon(
              size: 30.0,
              Icons.settings_rounded,
              color:
                  _currentScreenIndex == 3 ? kBlueThemeColor : kGreyThemeColor,
            ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

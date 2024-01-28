import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/screens/main_screens/global_chat_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/home_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/settings_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/user_report_screen.dart';

/// Main screen with bottom navigation bar
class MainScreenScreen extends StatefulWidget {
  const MainScreenScreen({super.key});

  @override
  State<MainScreenScreen> createState() => _MainScreenScreenState();
}

class _MainScreenScreenState extends State<MainScreenScreen> {
  /// Variable to store the current page index
  int _currentScreenIndex = 0;

  /// List of screens to navigate between
  final List<Widget> _screens = [
    const HomeScreen(),
    const GlobalChatScreen(),
    const UserReportScreen(),
    const SettingsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /// body of the main screen, selected from the list of screens
      body: _screens[_currentScreenIndex],

      /// Bottom navigation bar
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (index) {
          setState(() {
            _currentScreenIndex = index;
          });
        },
        animationDuration: const Duration(microseconds: 1),
        surfaceTintColor: kWhiteThemeColor,
        backgroundColor: kWhiteThemeColor,
        indicatorColor: Colors.transparent,
        selectedIndex: _currentScreenIndex,
        destinations: [
          /// Home button
          NavigationDestination(
            // If the buttons is clicked, index = 0
            // If the button is clicked, color = kBlueThemeColor, otherwise kGreyThemeColor
            icon: _currentScreenIndex == 0
                ? const Icon(
                    size: 35.0,
                    Icons.home_rounded,
                    color: kBlueThemeColor,
                  )
                : const Icon(
                    size: 35.0,
                    Icons.home_outlined,
                    color: kGreyThemeColor,
                  ),
            label: 'Home',
          ),

          /// Global Chat button
          NavigationDestination(
            // If the buttons is clicked, index = 1
            // If the button is clicked, color = kBlueThemeColor, otherwise kGreyThemeColor
            icon: _currentScreenIndex == 1
                ? const Icon(
                    size: 35.0,
                    Icons.explore_rounded,
                    color: kBlueThemeColor,
                  )
                : const Icon(
                    size: 35.0,
                    Icons.explore_outlined,
                    color: kGreyThemeColor,
                  ),
            label: 'Global Chat',
          ),

          /// User Report button
          NavigationDestination(
            // If the buttons is clicked, index = 2
            // If the button is clicked, color = kBlueThemeColor, otherwise kGreyThemeColor
            icon: _currentScreenIndex == 2
                ? const Icon(
                    size: 35.0,
                    Icons.bar_chart_rounded,
                    color: kBlueThemeColor,
                  )
                : const Icon(
                    size: 35.0,
                    Icons.bar_chart_outlined,
                    color: kGreyThemeColor,
                  ),
            label: 'User Report',
          ),

          /// Settings button
          NavigationDestination(
            // If the buttons is clicked, index = 3
            // If the button is clicked, color = kBlueThemeColor, otherwise kGreyThemeColor
            icon: _currentScreenIndex == 3
                ? const Icon(
                    size: 35.0,
                    Icons.settings_rounded,
                    color: kBlueThemeColor,
                  )
                : const Icon(
                    size: 35.0,
                    Icons.settings_outlined,
                    color: kGreyThemeColor,
                  ),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}

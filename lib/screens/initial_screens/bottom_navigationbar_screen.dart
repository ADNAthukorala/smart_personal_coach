import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/initial_screens/signin_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/explore_exercises_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/global_chat_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/home_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/profile_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/user_report_screen.dart';

/// Main screen with bottom navigation bar
class BottomNavigationBarScreenScreen extends StatefulWidget {
  const BottomNavigationBarScreenScreen({super.key});

  @override
  State<BottomNavigationBarScreenScreen> createState() =>
      _BottomNavigationBarScreenScreenState();
}

class _BottomNavigationBarScreenScreenState
    extends State<BottomNavigationBarScreenScreen> {
  // Creating an instances of FirebaseAuth and FirebaseFirestore
  final _auth = FirebaseAuth.instance;

  // Creating an user variable to store logged in user
  late User loggedInUser;

  // Variable to store the current page index
  int _currentScreenIndex = 0;

  /// Creating a method to get the logged in user
  void getLoggedIntUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedInUser = user;
      }
    } catch (e) {
      // Show snack bar with error message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('An error has occurred!')),
      );
    }
  }

  /// List of screens to navigate between
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreExercisesScreen(),
    const GlobalChatScreen(),
    const UserReportScreen(),
    const ProfileScreen(),
  ];

  /// Sign out method
  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      if (!mounted) return;
      // Show snack bar with 'Signed out' message
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Signed out!')),
      );
    } catch (e) {
      print("Error signing out: $e");
    }
  }

  void _showBackDialog() {
    showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: kAppThemeColor,
          title: const Text(
            'Are you sure?',
            style: TextStyle(color: kWhiteThemeColor),
          ),
          content: const Text(
            'Are you sure you want to sign out?',
            style: TextStyle(color: kWhiteThemeColor),
          ),
          actions: <Widget>[
            ElevatedButton(
              child: const Text(
                'No',
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            ElevatedButton(
              child: const Text(
                'Yes',
              ),
              onPressed: () {
                _signOut();
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const SignInScreen(),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    getLoggedIntUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (didPop) {
          return;
        }
        _showBackDialog();
      },
      child: Scaffold(
        /// body of the main screen, selected from the list of screens
        body: _screens[_currentScreenIndex],

        /// Bottom navigation bar
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _currentScreenIndex = index;
            });
          },
          animationDuration: const Duration(seconds: 1),
          surfaceTintColor: kWhiteThemeColor,
          backgroundColor: kWhiteThemeColor,
          indicatorColor: kAppThemeColor,
          selectedIndex: _currentScreenIndex,
          destinations: const [
            /// Home button
            NavigationDestination(
              // If the buttons is clicked, index = 0
              icon: Icon(
                Icons.home_rounded,
                color: kBlackThemeColor,
              ),

              label: 'Home',
              selectedIcon: Icon(
                Icons.home_rounded,
                color: kWhiteThemeColor,
              ),
            ),

            /// Explore button
            NavigationDestination(
              // If the buttons is clicked, index = 1
              icon: Icon(
                Icons.fitness_center_rounded,
                color: kBlackThemeColor,
              ),
              label: 'Explore',
              selectedIcon: Icon(
                Icons.fitness_center_rounded,
                color: kWhiteThemeColor,
              ),
            ),

            /// Community button
            NavigationDestination(
              // If the buttons is clicked, index = 2
              icon: Icon(
                Icons.group_rounded,
                color: kBlackThemeColor,
              ),
              label: 'Community',
              selectedIcon: Icon(
                Icons.group_rounded,
                color: kWhiteThemeColor,
              ),
            ),

            /// Report button
            NavigationDestination(
              // If the buttons is clicked, index = 3
              icon: Icon(
                Icons.bar_chart_rounded,
                color: kBlackThemeColor,
              ),
              label: 'Report',
              selectedIcon: Icon(
                Icons.bar_chart_rounded,
                color: kWhiteThemeColor,
              ),
            ),

            /// Profile button
            NavigationDestination(
              // If the buttons is clicked, index = 4
              icon: Icon(
                Icons.person_rounded,
                color: kBlackThemeColor,
              ),
              label: 'Profile',
              selectedIcon: Icon(
                Icons.person_rounded,
                color: kWhiteThemeColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/main_screens/exercises_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/global_chat_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/home_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/profile_screen.dart';
import 'package:smart_personal_coach/screens/main_screens/user_report_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:smart_personal_coach/screens/signin_screen.dart';

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
    const ExercisesScreen(),
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
          destinations: [
            /// Home button
            NavigationDestination(
              // If the buttons is clicked, index = 0
              // If the button is clicked, color = kWhiteThemeColor, otherwise black
              icon: _currentScreenIndex == 0
                  ? const Icon(
                      FontAwesomeIcons.house,
                      color: kWhiteThemeColor,
                    )
                  : const Icon(
                      FontAwesomeIcons.house,
                    ),
              label: 'Home',
            ),

            /// Exercises button
            NavigationDestination(
              // If the buttons is clicked, index = 1
              // If the button is clicked, color = kWhiteThemeColor, otherwise black
              icon: _currentScreenIndex == 1
                  ? const Icon(
                      FontAwesomeIcons.dumbbell,
                      color: kWhiteThemeColor,
                    )
                  : const Icon(
                      FontAwesomeIcons.dumbbell,
                    ),
              label: 'Exercises',
            ),

            /// Global Chat button
            NavigationDestination(
              // If the buttons is clicked, index = 2
              // If the button is clicked, color = kWhiteThemeColor, otherwise black
              icon: _currentScreenIndex == 2
                  ? const Icon(
                      FontAwesomeIcons.globe,
                      color: kWhiteThemeColor,
                    )
                  : const Icon(
                      FontAwesomeIcons.globe,
                    ),
              label: 'Global Chat',
            ),

            /// User Report button
            NavigationDestination(
              // If the buttons is clicked, index = 3
              // If the button is clicked, color = kWhiteThemeColor, otherwise black
              icon: _currentScreenIndex == 3
                  ? const Icon(
                      FontAwesomeIcons.chartSimple,
                      color: kWhiteThemeColor,
                    )
                  : const Icon(
                      FontAwesomeIcons.chartSimple,
                    ),
              label: 'User Report',
            ),

            /// Profile button
            NavigationDestination(
              // If the buttons is clicked, index = 4
              // If the button is clicked, color = kWhiteThemeColor, otherwise black
              icon: _currentScreenIndex == 4
                  ? const Icon(
                      FontAwesomeIcons.userGear,
                      color: kWhiteThemeColor,
                    )
                  : const Icon(
                      FontAwesomeIcons.userGear,
                    ),
              label: 'Profile',
            ),
          ],
        ),
      ),
    );
  }
}

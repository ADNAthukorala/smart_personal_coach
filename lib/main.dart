import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/components/constants.dart';
import 'package:smart_personal_coach/screens/welcome_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        drawerTheme: const DrawerThemeData(
          backgroundColor: kWhiteThemeColor,
        ),
        scaffoldBackgroundColor: kWhiteThemeColor,
        appBarTheme: const AppBarTheme(
          backgroundColor: kWhiteThemeColor,
          scrolledUnderElevation: 0,
        ),
      ),
      home: const WelcomeScreen(),
    );
  }
}

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:smart_personal_coach/constants.dart';
import 'package:smart_personal_coach/screens/welcome_screen.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> precacheAssets(BuildContext context) async {
    // List of asset images paths
    final List<String> assetPaths = [
      'images/abs.png',
      'images/arms.png',
      'images/back.png',
      'images/chest.png',
      'images/facebook_logo.png',
      'images/full_body_image.png',
      'images/gender_selection_screen_image.jpg',
      'images/google_logo.png',
      'images/legs.png',
      'images/meditation.png',
      'images/signin_screen_image.jpg',
      'images/signup_screen_image.jpg',
      'images/welcome_screen_image.jpg',
    ];

    // List of network images paths
    final List<String> networkPaths = [
      'https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fchest%2Fpush_ups%2Fanim-push-ups.gif?alt=media&token=19676f39-725f-4339-a4d2-50be22837dd4',
      'https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fchest%2Fpush_ups%2Ffocus-push-ups.png?alt=media&token=502ad1b6-70c3-43d5-aefa-8ccc0deaa4a8',
      'https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fback%2Fpull_ups%2Fanim-pull-ups.gif?alt=media&token=68a1711a-db68-4de0-964b-054b340c0883',
      'https://firebasestorage.googleapis.com/v0/b/smartpersonalcoach.appspot.com/o/exercises%2Fback%2Fpull_ups%2Ffocus-pull-ups.png?alt=media&token=c8138577-9b8b-4017-acdf-0ebbb5b4679b',
    ];

    // Precache all asset images
    for (String path in assetPaths) {
      if (!context.mounted) return;
      await precacheImage(AssetImage(path), context);
    }

    // Precache all network images
    for (String url in networkPaths) {
      if (!context.mounted) return;
      await precacheImage(NetworkImage(url), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: precacheAssets(context),
      builder: (BuildContext context, AsyncSnapshot<void> snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the initialization is in progress, show a loading indicator
          return MaterialApp(
            home: Scaffold(
              body: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('images/welcome_screen_image.jpg'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: const Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CircularProgressIndicator(
                        color: kAppThemeColor,
                        strokeAlign: 4.0,
                        backgroundColor: kWhiteThemeColor,
                        strokeWidth: 8.0,
                      ),
                      SizedBox(
                        height: 25.0,
                      ),
                      Text(
                        "Loading...",
                        style: TextStyle(
                            color: kWhiteThemeColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 20.0),
                      )
                    ],
                  ),
                ),
              ),
            ),
          );
        } else if (snapshot.hasError) {
          // If an error occurs during initialization, display an error message
          return const MaterialApp(
            home: Scaffold(
              body: Center(
                child: Text('Error occurred during initialization'),
              ),
            ),
          );
        } else {
          // Once initialization is complete, build the main app UI
          return MaterialApp(
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: kAppThemeColor),
              useMaterial3: true,
              fontFamily: 'Roboto',
              scaffoldBackgroundColor: kWhiteThemeColor,
              appBarTheme: const AppBarTheme(
                color: kAppThemeColor,
                shadowColor: kAppThemeColor,
                elevation: 4,
              ),
            ),
            home: const WelcomeScreen(),
          );
        }
      },
    );
  }
}

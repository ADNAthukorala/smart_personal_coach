import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smart_personal_coach/auth_check.dart';
import 'package:smart_personal_coach/constants.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> precacheAssets(BuildContext context) async {
    // List of asset images paths
    final List<String> assetPaths = [
      'images/abs.jpg',
      'images/arms.jpg',
      'images/back.jpg',
      'images/chest.jpg',
      'images/legs.jpg',
      'images/signin-screen-image.jpg',
      'images/signup-screen-image.jpg',
      'images/theme-image.jpg',
      'images/adna-logo-animation.gif',
      'images/facebook-logo.png',
      'images/google-logo.png',
      'images/full-body-image.png',
      'images/gender-selection-screen-image.jpg',
    ];

    // Precache all asset images
    for (String path in assetPaths) {
      await precacheImage(AssetImage(path), context);
    }

    await Future.delayed(const Duration(milliseconds: 500));
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
              backgroundColor: kBlackThemeColor,
              body: Center(
                child:
                    Image.asset('images/adna-logo-animation.gif', width: 120),
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
                elevation: 2,
              ),
            ),
            home: const AuthCheck(),
          );
        }
      },
    );
  }
}

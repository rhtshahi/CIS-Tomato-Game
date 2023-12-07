/// Importing necessary packages and files
import 'package:cis_tomato_game/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// The main entry point for the Flutter application
Future<void> main() async {
  ///Ensure Firebase is initialize before running application
  WidgetsFlutterBinding.ensureInitialized();

  /// Initialize Firebase with the specified options
  await Firebase.initializeApp(options:
   DefaultFirebaseOptions.currentPlatform);

  ///Run Flutter Application
  runApp(const MyApp());
}


/// The main application widget
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  /// This widget is the root of application.
  @override
  Widget build(BuildContext context) {

    /// MaterialApp widget is the root of the application
    return const MaterialApp(
      debugShowCheckedModeBanner: false, /// Disable the debug banner
      home: LoginPage(), /// Set the home page to the LoginPage
    );
  }
}
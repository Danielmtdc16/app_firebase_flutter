import 'package:flutter/material.dart';
//import 'package:app_firebase_flutter/screens/register_screen.dart';
import 'package:app_firebase_flutter/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(const MaterialApp(
    home: LoginScreen(),
  ));
}

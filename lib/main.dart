import 'package:app/User/Splashscreen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_cable_app/Admin/Bills/Bills.dart';
// import 'Admin/AdminDashboard.dart';

void main() async {
  // Ensure that Flutter is initialized.

  WidgetsFlutterBinding.ensureInitialized();

  // Initialize Firebase.
  await Firebase.initializeApp();
  // Continue with the rest of your application setup.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      // ignore: prefer_const_constructors
      home: Splashscreen(),
    );
  }
}

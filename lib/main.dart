import 'package:flutter/material.dart';
import 'splash_screen.dart'; // Import your splash screen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ghar Bhada',
      theme: ThemeData(
          // Your app theme
          ),
      home: SplashScreen(), // Show splash screen initially
    );
  }
}

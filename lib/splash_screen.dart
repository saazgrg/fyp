import 'dart:async';
import 'package:flutter/material.dart';
import 'register_screen.dart'; // Import your register screen widget

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ghar Bhada',
      theme: ThemeData(
          // Your app theme
          ),
      home: SplashScreen(), // Show splash screen initially
    );
  }
}

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // Delay navigation to the main screen using Timer
    Timer(
      Duration(seconds: 4), // Adjust the duration as needed
      () {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => RegisterScreen(), // Navigate to the register screen
          ),
        );
      },
    );

    // Return the splash screen widget
    return Scaffold(
      backgroundColor: Color(0xFFF1F1F4),
      body: Center(
        child: Image.asset(
          'lib/images/splash.png', // Path to your image
          width: 800,
          height: 800,
        ),
      ),
    );
  }
}

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // This is your main screen widget
    return Scaffold(
      appBar: AppBar(
        title: Text('Main Screen'),
      ),
      body: Center(
        child: Text('Welcome to Ghar Bhada!'),
      ),
    );
  }
}

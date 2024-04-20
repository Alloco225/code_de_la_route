import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

final ThemeData kDarkTheme = ThemeData.dark().copyWith(
  primaryColor:
      Colors.blueGrey[900], // Primary color, a dark shade of blue-gray
  scaffoldBackgroundColor: Colors.blueGrey[800], // Scaffold background color
  appBarTheme: AppBarTheme(
    color: Colors.blueGrey[900], // Brightness of app bar
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark, // Icon color in app bar
  ),
  hintColor: Colors.orangeAccent, // Accent color, orange
  // buttonColor: Colors.greenAccent, // Button color, green
  textTheme: const TextTheme(
    // Text theme

    titleLarge: TextStyle(
        fontFamily: 'ProductSans', color: Colors.white), // Headline text color
    bodyLarge: TextStyle(
        fontFamily: 'ProductSans', color: Colors.white), // Body text color
    bodyMedium: TextStyle(
        fontFamily: 'ProductSans',
        color: Colors.white70), // Secondary body text color
  ),
  iconTheme: const IconThemeData(color: Colors.white), // Icon color
);

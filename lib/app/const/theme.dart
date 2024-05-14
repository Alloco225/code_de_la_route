import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// #1E3D59
// #F18D01
// #35A12C
// #F8F8FF
// #152B3F

const darkBlueColor = Color(0xFF1E3D59);
const orangeColor = Color(0xFFF18D01);
const greenColor = Color(0xFF35A12C);
const ghostWhite = Color(0xFFF8F8FF);
const colorWhite = ghostWhite;

var appShadow = [
  BoxShadow(
      color: Colors.grey[300]!, offset: const Offset(0, -2), blurRadius: 15),
  BoxShadow(
      color: Colors.grey[300]!, offset: const Offset(0, 2), blurRadius: 15),
];

appTextStyle(
    {double fs = 18, FontWeight fw = FontWeight.w500, color = Colors.black}) {
  return TextStyle(
    fontSize: fs,
    fontWeight: fw,
    color: color ?? Colors.blueGrey[900],
  );
}

final ButtonStyle kFlatButtonStyle = TextButton.styleFrom(
  // minimumSize: Size(_width, _height),
  backgroundColor: Colors.grey,
  padding: const EdgeInsets.all(0),
);

final ThemeData kDarkTheme = ThemeData.light().copyWith(
  // bottomSheetTheme:
  //     const BottomSheetThemeData().copyWith(backgroundColor: Colors.white),
  primaryColor: const Color(0xFFF18D01),

  // Colors.blueGrey[900], // Primary color, a dark shade of blue-gray
  // scaffoldBackgroundColor: Colors.blueGrey[800], // Scaffold background color
  scaffoldBackgroundColor:
      Colors.blueGrey.shade700, // Scaffold background color
  // scaffoldBackgroundColor: Colors.blueGrey[800], // Scaffold background color
  appBarTheme: AppBarTheme(
    // color: Colors.blueGrey[900], // Brightness of app bar
    color: Colors.blueGrey.shade700, // Brightness of app bar
    iconTheme: const IconThemeData(color: Colors.white),
    systemOverlayStyle: SystemUiOverlayStyle.dark, // Icon color in app bar
  ),
  hintColor: Colors.orangeAccent, // Accent color, orange
  // buttonColor: Colors.greenAccent, // Button color, green
  textTheme: const TextTheme(
    // Text theme
    titleMedium: TextStyle(fontFamily: 'ProductSans', color: Colors.white),
    titleLarge: TextStyle(
        fontFamily: 'ProductSans', color: Colors.white), // Headline text color
    bodyLarge: TextStyle(
        fontFamily: 'ProductSans',
        color: Colors.white,
        fontWeight: FontWeight.w700), // Body text color
    bodyMedium: TextStyle(
        fontFamily: 'ProductSans',
        color: Colors.white), // Secondary body text color
  ),
  iconTheme: const IconThemeData(color: Colors.white), // Icon color
  // elevatedButtonTheme: const ElevatedButtonThemeData(
  // style: ButtonStyle().copyWith(shape: )
  // )
);

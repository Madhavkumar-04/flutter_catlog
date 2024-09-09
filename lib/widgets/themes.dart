import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

class MyTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
    primarySwatch: Colors.deepPurple,
    fontFamily: GoogleFonts.poppins().fontFamily,
    canvasColor: creamColor,
    cardColor: Colors.white,
    buttonTheme: ButtonThemeData(buttonColor: blueish),
    highlightColor: blueish,
    focusColor: blueish,
    appBarTheme: AppBarTheme(
      color: Colors.white,
      elevation: 0.0,
      iconTheme: IconThemeData(color : Colors.black),
    ),
  );


  static ThemeData darkTheme(BuildContext context) => ThemeData(
    brightness: Brightness.dark,
        fontFamily: GoogleFonts.poppins().fontFamily,
        canvasColor: darkCreamColor,
        cardColor: Colors.black,
        buttonTheme: ButtonThemeData(buttonColor: lightBlueish),
        highlightColor: lightBlueish,
        focusColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
      );

  //colors
  static Color creamColor = Color(0xfff5f5f5);
  static Color darkCreamColor = Vx.gray900;
  static Color blueish = Color(0xff403b58);
  static Color lightBlueish = Vx.indigo500;
}
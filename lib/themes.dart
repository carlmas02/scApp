import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonMethod {
  ThemeData themedata = ThemeData(
      primaryColor: Color(0xffbf372b),
      fontFamily: GoogleFonts.varela().fontFamily,
      appBarTheme: AppBarTheme(
        color: Color(0xffbf372b),
      ),
      primarySwatch: Colors.red,
      scaffoldBackgroundColor: Colors.black,
      textTheme: TextTheme(
        bodyText1: TextStyle(fontSize: 24.0),
        bodyText2: TextStyle(fontSize: 24.0),
      ).apply(
        bodyColor:Color(0xffe0b668),)
      );
}

final ButtonStyle button1 = ElevatedButton.styleFrom(
    primary: Color(0xffbf372b),
    onPrimary: Color(0xffffffff),
    minimumSize: Size(140, 50),
    padding: EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(10)),
    ),
    textStyle: TextStyle(fontSize: 19));


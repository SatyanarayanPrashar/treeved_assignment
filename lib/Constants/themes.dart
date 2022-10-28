import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData lightTheme = ThemeData(
    fontFamily: 'GoogleFonts.notoSans',
    brightness: Brightness.light,
    scaffoldBackgroundColor: Color(0xffF5F5F5),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 3,
      iconTheme: IconThemeData(color: Colors.black),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));

ThemeData darkTheme = ThemeData(
    fontFamily: 'GoogleFonts.notoSans',
    brightness: Brightness.dark,
    scaffoldBackgroundColor: const Color(0xff15161a),
    appBarTheme: const AppBarTheme(
      elevation: 3,
      backgroundColor: Color(0xff15161a),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: Colors.blue,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
    ));

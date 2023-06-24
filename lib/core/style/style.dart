import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData themeData = ThemeData(
  textTheme: TextTheme(
    titleLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 28,
        color: Color(0xFF211B42),
        fontWeight: FontWeight.bold,
      ),
    ),
    titleMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xFF211B42),
        fontSize: 24,
        fontWeight: FontWeight.w400,
      ),
    ),
    titleSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xFF211B42),
        fontSize: 20,
        fontWeight: FontWeight.w400,
      ),
    ),
    bodyLarge: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 20,
      ),
    ),
    bodyMedium: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 18,
        color: Colors.black,
      ),
    ),
    bodySmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        color: Color(0xFF1A171B),
        fontSize: 14,
      ),
    ),
    labelSmall: GoogleFonts.poppins(
      textStyle: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.bold,
      ),
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      padding: MaterialStateProperty.all(
        const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 14,
        ),
      ),
      backgroundColor:
          MaterialStateProperty.all<Color>(const Color(0xFFE5006D)),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(60),
        ),
      ),
    ),
  ),
);

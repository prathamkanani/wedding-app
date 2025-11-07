import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color.fromRGBO(154, 33, 67, 1),
      onPrimary: Color.fromRGBO(235, 235, 235, 1),
      secondary: Color.fromRGBO(255, 254, 252, 1),
      onSecondary: Color.fromRGBO(28, 28, 30, 1),
      error: Colors.red,
      onError: Colors.white,
      surface: Color.fromRGBO(255, 254, 252, 1),
      onSurface: Colors.black,
    ),
    textTheme: TextTheme(
      titleLarge: GoogleFonts.cormorantGaramond(fontSize: 28, fontWeight: FontWeight.w600),
      titleMedium: GoogleFonts.cormorantGaramond(fontSize: 24, fontWeight: FontWeight.w600),
      titleSmall: GoogleFonts.cormorantGaramond(fontSize: 20, fontWeight: FontWeight.w600),
      bodyMedium: GoogleFonts.inter(fontSize: 16, fontWeight: FontWeight.w400),
      bodySmall: GoogleFonts.inter(fontSize: 12, fontWeight: FontWeight.w500),
    ),
  );
}

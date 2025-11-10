import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xFF9A2143),
      onPrimary: Color(0xFFEBEBEB),
      secondary: Color(0xFFFFFEFC),
      onSecondary: Color(0xFF1C1C1E),
      tertiary: Color(0xFFFBF8F2),
      error: Colors.red,
      onError: Colors.white,
      surface: Color(0xFFFFFEFC),
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

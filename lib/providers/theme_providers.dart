import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeProvider({required bool isDartMode})
      : currentTheme = isDartMode
            ? ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.dark(),
                fontFamily: GoogleFonts.montserrat().fontFamily)
            : ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.light(),
                fontFamily: GoogleFonts.montserrat().fontFamily);

  setClaro() {
    currentTheme = ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.light(),
        fontFamily: GoogleFonts.montserrat().fontFamily);
    notifyListeners();
  }

  setOscuro() {
    currentTheme = ThemeData(
        useMaterial3: true,
        colorScheme: const ColorScheme.dark(),
        fontFamily: GoogleFonts.montserrat().fontFamily);
    notifyListeners();
  }
}

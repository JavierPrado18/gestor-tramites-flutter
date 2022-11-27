import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData currentTheme;
  ThemeProvider({required bool isDartMode})
      : currentTheme = isDartMode
            ? ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.dark(),
                fontFamily: GoogleFonts.montserrat().fontFamily,
                appBarTheme: AppBarTheme(
                    backgroundColor: Color.fromRGBO(112, 25, 28, 1)),
              )
            : ThemeData(
                useMaterial3: true,
                colorScheme: const ColorScheme.light(),
                fontFamily: GoogleFonts.montserrat().fontFamily,
                appBarTheme: AppBarTheme(
                    backgroundColor: Color.fromRGBO(112, 25, 28, 1)),
              );

  setClaro() {
    currentTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.light(),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(112, 25, 28, 1)),
    );
    notifyListeners();
  }

  setOscuro() {
    currentTheme = ThemeData(
      useMaterial3: true,
      colorScheme: const ColorScheme.dark(),
      fontFamily: GoogleFonts.montserrat().fontFamily,
      appBarTheme: AppBarTheme(backgroundColor: Color.fromRGBO(112, 25, 28, 1)),
    );
    notifyListeners();
  }
}

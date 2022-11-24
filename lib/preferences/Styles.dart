import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  /////Colores///////////////
  static Color textColorScreen = Colors.greenAccent;
  static Color textColorScreen2 = Colors.blueGrey;
  static Color botonColorScreen = Colors.blueGrey;

  ///////Stylos//////////////
  static TextStyle titleDrawer = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle subtitleDrawer = const TextStyle(
      fontSize: 11, fontWeight: FontWeight.normal, color: Colors.white);
  static TextStyle titleScreen =
      GoogleFonts.acme(color: textColorScreen, fontSize: 25);
  static TextStyle subtitleScreen =
      GoogleFonts.acme(color: textColorScreen2, fontSize: 23);
}

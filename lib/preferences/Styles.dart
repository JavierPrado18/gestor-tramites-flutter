import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Styles {
  /////Colores///////////////
  ///
  ///
  static Color textColorScreen = Colors.greenAccent;
  static Color textColorScreen2 = Colors.white;
  // static Color textColorScreen2 = Colors.blueGrey;
  static Color botonColorScreen = Colors.blueGrey;

  static Color appColor = Color.fromRGBO(112, 25, 28, 1);

  static Color botonDisabledColorScreen = Color.fromARGB(255, 93, 126, 16);

  ///////Stylos//////////////
  static TextStyle titleDrawer = const TextStyle(
      fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white);
  static TextStyle subtitleDrawer = const TextStyle(
      fontSize: 11, fontWeight: FontWeight.normal, color: Colors.white);
  static TextStyle titleScreen =
      TextStyle(color: textColorScreen, fontSize: 25);
  static TextStyle subtitleScreen = TextStyle(
      color: textColorScreen2, fontSize: 23, fontWeight: FontWeight.bold);
  static TextStyle helpText =
      const TextStyle(color: Colors.white, fontSize: 12);

  static TextStyle appbarText = const TextStyle(
    color: Colors.white,
  );
}

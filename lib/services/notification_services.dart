import 'package:flutter/material.dart';

class NotificationServices {
  static GlobalKey<ScaffoldMessengerState> messengerKey =
      new GlobalKey<ScaffoldMessengerState>();

  static showSnackbar(String message) {
    final snackBar = SnackBar(
        backgroundColor: Colors.blue,
        content: Row(
          children: [
            Icon(
              Icons.tag_faces_sharp,
              color: Colors.white,
            ),
            Expanded(
              child: Text(' Datos Enviados'),
            )
          ],
        ));

    messengerKey.currentState!.showSnackBar(snackBar);
  }
}

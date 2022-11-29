import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/services/services_auth.dart';

class VerifyAuthScreen extends StatelessWidget {
  const VerifyAuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final autService = Provider.of<AuthService>(context, listen: false);
    return Scaffold(
      backgroundColor: Styles.appColor,
      body: Center(
        child: FutureBuilder(
          future: autService.leerToken(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) {
              return const Text('Espera un touch..',
                  style: TextStyle(
                    fontSize: 28,
                  ));
            }
            if (snapshot.data == '') {
              Future.microtask(() {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoutes.rLogin, (route) => false);
              });
            } else {
              Future.microtask(() {
                Navigator.pushNamedAndRemoveUntil(
                    context, MyRoutes.rHome, (route) => false);
              });
            }
            return Container(
              color: Styles.appColor,
            );
          },
        ),
      ),
    );
  }
}

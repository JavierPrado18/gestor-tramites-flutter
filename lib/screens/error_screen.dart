import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/routes/route.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
              'https://media.giphy.com/media/LElcrTIMPth0w8UTbE/giphy.gif'),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 5),
            child: SizedBox(
              height: 40,
              width: 220,
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)),
                disabledColor: Styles.textColorScreen,
                elevation: 1,
                color: Styles.botonColorScreen,
                onPressed: () {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
                },
                child: const Text('Ir a Inicio'),
              ),
            ),
          ),
          //Text('')
        ],
      ),
    );
  }
}

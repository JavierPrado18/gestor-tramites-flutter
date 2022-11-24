import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/widgets/index.dart';

class RecuperarScreen extends StatelessWidget {
  const RecuperarScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Recuperar Contraseña',
              style: Styles.subtitleScreen,
            ),
            const Text(
              'Se enviara una clave transitoria a tu correo',
              //style: Styles.subtitleScreen,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CustomTextFieldScreen(
                hintext: 'nom.apellidosara@P@unmsm.edu.pe',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 40,
                width: 220,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  disabledColor: Styles.textColorScreen,
                  elevation: 1,
                  color: Styles.botonColorScreen,
                  onPressed: () async {
                    await Future.delayed(const Duration(seconds: 2));

                    // ignore: use_build_context_synchronously
                    Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
                  },
                  child: const Text('Reestablecer Contraseña'),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

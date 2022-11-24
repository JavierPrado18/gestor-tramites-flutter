// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/routes/route.dart';

class CrearUsuarioScreen extends StatelessWidget {
  const CrearUsuarioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      child: GestureDetector(
        onTap: () {
          // final FocusScopeNode focus = FocusScope.of(context);
          // if (!focus.hasPrimaryFocus && focus.hasFocus) {
          //   FocusManager.instance.primaryFocus!.unfocus();
          // }
        },
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Form(
                child: Column(
              children: [
                Text('Crear Cuenta', style: Styles.subtitleScreen),

                ///Validar que DNI exista
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    autocorrect: false,
                    obscureText: false,
                    keyboardType: TextInputType.number,
                    decoration: textFormdecoration(
                      hintText: 'Correo Institucional',
                      prefIcon: const Icon(
                        Icons.perm_identity_sharp,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      String caracteres =
                          r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
                      RegExp regExp = RegExp(caracteres);
                      return regExp.hasMatch(value ?? '')
                          ? null
                          : 'Correo No valido';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    autocorrect: false,
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    decoration: textFormdecoration(
                      hintText: 'Contraseña',
                      prefIcon: const Icon(
                        Icons.key,
                        color: Colors.grey,
                      ),
                    ),
                    validator: (value) {
                      return (value != null && value.length >= 8)
                          ? null
                          : 'Datos Incorrectos';
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8,
                  ),
                  child: TextFormField(
                    style: const TextStyle(color: Colors.black, fontSize: 14),
                    autocorrect: false,
                    keyboardType: TextInputType.text,
                    decoration: textFormdecoration(
                      hintText: 'repetir Contraseña',
                      prefIcon: const Icon(
                        Icons.key,
                        color: Colors.grey,
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: SizedBox(
                    height: 40,
                    width: 220,
                    child: MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      disabledColor: Colors.green,
                      elevation: 1,
                      color: Colors.green,
                      onPressed: () async {
                        await Future.delayed(const Duration(seconds: 2));

                        Navigator.pushReplacementNamed(
                            context, MyRoutes.rLogin);
                      },
                      child: const Text('CREAR CUENTA'),
                    ),
                  ),
                ),
              ],
            ))
          ],
        ),
      ),
    ));
  }

  InputDecoration textFormdecoration(
      {final String? hintText,
      final Widget? prefIcon,
      final Widget? sufixIcon}) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide:
              const BorderSide(width: 2, color: Color.fromRGBO(230, 57, 70, 1)),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(
              width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Color.fromARGB(192, 255, 255, 255),
        hintText: '${hintText}',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefIcon,
        suffixIcon: sufixIcon,
        contentPadding: const EdgeInsets.all(8));
  }
}

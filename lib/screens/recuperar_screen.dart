import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/provider_login.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/widgets/index.dart';

class RecuperarScreen extends StatefulWidget {
  const RecuperarScreen({super.key});

  @override
  State<RecuperarScreen> createState() => _RecuperarScreenState();
}

class _RecuperarScreenState extends State<RecuperarScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 20),
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  _RecuperarForm(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _RecuperarForm extends StatefulWidget {
  const _RecuperarForm({super.key});

  @override
  State<_RecuperarForm> createState() => _RecuperarFormState();
}

class _RecuperarFormState extends State<_RecuperarForm> {
  @override
  Widget build(BuildContext context) {
    final login = Provider.of<ProviderLogin>(context);
    final usuarioController = TextEditingController(text: Preferences.usuario);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 2),
      child: Form(
          key: login.formKey,
          child: Column(
            children: [
              Text(
                'Recuperar Contraseña  ',
                style: Styles.subtitleScreen,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 65,
                width: 300,
                child: Text(
                  "Se enviara una clave transitoria a tu correo, \ndicha contraseña tendra una duracion de 10 minutos. \nDeberas cambiarla luego de ingresar al aplicativo",
                  style: Styles.helpText, textAlign: TextAlign.justify,
                  //style: Styles.subtitleScreen,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                child: TextFormField(
                  controller: usuarioController,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textFormdecoration(
                      hintText: 'nombres.apellidos@unmsm.edu.pe',
                      prefIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      )),
                  onChanged: (value) {
                    login.email = value;
                    Preferences.usuario = value;
                  },
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

              //////////////////////////////////
              ///////////botones////////////
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 9),
                child: SizedBox(
                  height: 40,
                  //width: 220,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    disabledColor: Styles.botonDisabledColorScreen,
                    elevation: 1,
                    color: Styles.botonColorScreen,
                    onPressed: login.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();

                            if (!login.isValidForm()) {
                              return;
                            }

                            login.isLoading = true;
                            await Future.delayed(const Duration(seconds: 2));
                            login.isLoading = false;

                            // ignore: use_build_context_synchronously
                            Navigator.pushReplacementNamed(
                                context, MyRoutes.rLogin);
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.send),
                        const SizedBox(
                          width: 8,
                        ),
                        (login.isLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('Enviar Clave a mi Correo'),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: SizedBox(
                  height: 40,
                  //width: 220,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    disabledColor: Colors.transparent,
                    elevation: 1,
                    color: Colors.transparent,
                    onPressed: () {
                      Navigator.pushReplacementNamed(context, MyRoutes.rLogin);
                    },
                    child: Text('Iniciar Sesion',
                        style: TextStyle(color: Styles.textColorScreen)),
                  ),
                ),
              ),
            ],
          )),
    );
  }
}

InputDecoration textFormdecoration(
    {final String? hintText, final Widget? prefIcon, final Widget? sufixIcon}) {
  return InputDecoration(
      enabledBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
      errorBorder: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 2, color: Color.fromRGBO(230, 57, 70, 1)),
        borderRadius: BorderRadius.circular(15),
      ),
      border: OutlineInputBorder(
        borderSide:
            const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174, 1)),
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

// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/provider_login.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/services/notification_services.dart';
import 'package:proyecto1/services/services_auth.dart';

class CrearUsuarioScreen extends StatefulWidget {
  const CrearUsuarioScreen({super.key});

  @override
  State<CrearUsuarioScreen> createState() => _CrearUsuarioScreenState();
}

class _CrearUsuarioScreenState extends State<CrearUsuarioScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
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
                  children: [
                    ChangeNotifierProvider(
                      create: (context) => ProviderLogin(),
                      child: const _RegistrarForm(),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }
}

class _RegistrarForm extends StatefulWidget {
  const _RegistrarForm({super.key});

  @override
  State<_RegistrarForm> createState() => _RegistrarFormState();
}

class _RegistrarFormState extends State<_RegistrarForm> {
  bool ocultarPassword = true;
  bool ocultarPasswordRep = true;
  void _viewPassword() {
    setState(() {
      ocultarPassword = !ocultarPassword;
    });
  }

  void _viewPasswordRep() {
    setState(() {
      ocultarPasswordRep = !ocultarPasswordRep;
    });
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<ProviderLogin>(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
          key: login.formKey,
          child: Column(
            children: [
              Text('Crear Cuenta', style: Styles.subtitleScreen),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 8,
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  autocorrect: false,
                  keyboardType: TextInputType.emailAddress,
                  decoration: textFormdecorationCC(
                      hintText: 'nombres.apellidos@unmsm.edu.pe',
                      prefIcon: const Icon(
                        Icons.email_outlined,
                        color: Colors.grey,
                      )),
                  onChanged: (value) {
                    login.email = value;
                    // Preferences.usuario = value;
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
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  autocorrect: false,
                  obscureText: ocultarPassword,
                  keyboardType: TextInputType.text,
                  decoration: textFormdecorationCC(
                    hintText: 'Contraseña',
                    prefIcon: const Icon(
                      Icons.key,
                      color: Colors.grey,
                    ),
                    sufixIcon: InkWell(
                      ////para manejar lo del ojito
                      onTap: _viewPassword,
                      child: Icon(ocultarPassword
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  onChanged: (value) {
                    login.password = value;
                    // Preferences.password = value;
                  },
                  validator: (value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'Debe contener mas de 8 caracteres';
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  autocorrect: false,
                  obscureText: ocultarPasswordRep,
                  keyboardType: TextInputType.text,
                  decoration: textFormdecorationCC(
                    hintText: 'Repetir Contraseña',
                    prefIcon: const Icon(
                      Icons.key,
                      color: Colors.grey,
                    ),
                    sufixIcon: InkWell(
                      ////para manejar lo del ojito
                      onTap: _viewPasswordRep,
                      child: Icon(ocultarPasswordRep
                          ? Icons.visibility
                          : Icons.visibility_off),
                    ),
                  ),
                  // onChanged: (value) {
                  //   login.password = value;
                  //   // Preferences.password = value;
                  // },
                  validator: (value) {
                    print(Preferences.password);
                    return (value != null && value == login.password)
                        ? null
                        : 'Las contraseñas deben conincidir';
                  },
                ),
              ),

              //////////////////////////////////
              ///////////botones////////////
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: 40,
                  width: 220,
                  child: MaterialButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    disabledColor: Styles.textColorScreen,
                    elevation: 1,
                    color: Styles.botonColorScreen,
                    onPressed: login.isLoading
                        ? null
                        : () async {
                            FocusScope.of(context).unfocus();

                            final authService = Provider.of<AuthService>(
                                context,
                                listen: false);

                            if (!login.isValidForm()) {
                              return;
                            }

                            login.isLoading = true;
                            final String? errorMessage = await authService
                                .createUser(login.email, login.password);
                            if (errorMessage == null) {
                              Future.delayed(const Duration(milliseconds: 500),
                                  () {
                                NotificationServices.showSnackbar(
                                    'Trámite enviado');
                              });
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, MyRoutes.rLogin);
                            } else {
                              login.isLoading = false;
                            }
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.person_add),
                        const SizedBox(
                          width: 8,
                        ),
                        (login.isLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('REGISTRAR'),
                      ],
                    ),
                  ),
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

InputDecoration textFormdecorationCC(
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

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/index.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/services/services_auth.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: GestureDetector(
          onTap: () {
            final FocusScopeNode focus = FocusScope.of(context);
            if (!focus.hasPrimaryFocus && focus.hasFocus) {
              FocusManager.instance.primaryFocus!.unfocus();
            }
          },
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: AlignmentDirectional.center,
                  children: [
                    Container(
                        width: 250,
                        height: 120,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'SISTEMA DE TRAMITES UNMSM',
                              textAlign: TextAlign.center,
                              style: Styles.titleScreen,
                            ),
                          ],
                        )),
                  ],
                ),
                SizedBox(
                  height: 120,
                  width: 150,
                  child: Lottie.network(
                      'https://assets10.lottiefiles.com/packages/lf20_wvP5dh5G7l.json'),
                ),
                ChangeNotifierProvider(
                  create: (context) => ProviderLogin(),
                  child: _LogginForm(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _LogginForm extends StatefulWidget {
  const _LogginForm({super.key});

  @override
  State<_LogginForm> createState() => __LogginFormState();
}

class __LogginFormState extends State<_LogginForm> {
  bool ocultarPassword = true;
  void _viewPassword() {
    setState(() {
      ocultarPassword = !ocultarPassword;
    });
  }

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<ProviderLogin>(context);
    final usuarioController = TextEditingController(text: Preferences.usuario);
    final passwordController =
        TextEditingController(text: Preferences.password);
    void guardarDatos() {
      Preferences.usuario = usuarioController.text;
      Preferences.password = passwordController.text;
    }

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
          key: login.formKey,
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
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
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: TextFormField(
                  controller: passwordController,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                  autocorrect: false,
                  obscureText: ocultarPassword,
                  keyboardType: TextInputType.text,
                  decoration: textFormdecoration(
                    hintText: '********',
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
                    Preferences.password = value;
                  },
                  validator: (value) {
                    return (value != null && value.length >= 8)
                        ? null
                        : 'Datos Incorrectos';
                  },
                ),
              ),

              //////////////////////////////////
              ///////////botones////////////
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
                                .login(login.email, login.password);
                            if (errorMessage == null) {
                              guardarDatos();
                              // ignore: use_build_context_synchronously
                              Navigator.pushReplacementNamed(
                                  context, MyRoutes.rHome);
                            } else {
                              login.isLoading = false;
                            }
                          },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.login),
                        const SizedBox(
                          width: 8,
                        ),
                        (login.isLoading)
                            ? const CircularProgressIndicator(
                                color: Colors.white)
                            : const Text('INGRESAR'),
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
                      Navigator.pushReplacementNamed(
                          context, MyRoutes.rRecuperar);
                    },
                    child: Text('Olvide mi Contraseña',
                        style: TextStyle(color: Styles.textColorScreen)),
                  ),
                ),
              ),
              const Divider(
                color: Colors.blueAccent,
                indent: 10,
                endIndent: 10,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tieenes una cuenta?',
                      style: Styles.helpText,
                    ),
                    MaterialButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      disabledColor: Styles.textColorScreen,
                      elevation: 1,
                      color: Colors.transparent,
                      onPressed: () {
                        Navigator.pushReplacementNamed(
                            context, MyRoutes.rCuentaNueva);
                      },
                      child: Text('Regitrate Aqui',
                          style: TextStyle(color: Styles.textColorScreen)),
                    ),
                  ],
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

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/index.dart';
import 'package:proyecto1/routes/route.dart';

class EditUsuarioScreen extends StatefulWidget {
  const EditUsuarioScreen({super.key});

  @override
  State<EditUsuarioScreen> createState() => _EditUsuarioScreenState();
}

class _EditUsuarioScreenState extends State<EditUsuarioScreen> {
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
    final telefonoController =
        TextEditingController(text: Preferences.telefono);
    final imgController = TextEditingController(text: Preferences.img);

    void guardarDatos() {
      Preferences.usuario = usuarioController.text;
      Preferences.password = passwordController.text;
      Preferences.telefono = telefonoController.text;
      Preferences.img = imgController.text;
    }

    return Scaffold(
      backgroundColor: Color.fromARGB(192, 210, 65, 69),
      appBar: AppBar(
        title: Text(
          'Actualizar datos',
          style: Styles.appbarText,
        ),
        centerTitle: true,
        //backgroundColor: Color.fromARGB(141, 255, 255, 255),
      ),
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
                SizedBox(
                  height: 30,
                ),
                // Stack(
                //   alignment: AlignmentDirectional.center,
                //   children: [
                //     Container(
                //         width: 250,
                //         height: 120,
                //         child: Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           children: [
                //             // Text(
                //             //   'Actualizar datos',
                //             //   textAlign: TextAlign.center,
                //             //   style: Styles.titleScreen,
                //             // ),
                //           ],
                //         )),
                //   ],
                // ),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 30),
                  child: Form(
                      key: login.formKey,
                      child: Column(
                        children: [
                          Text(
                            "Cambiar imagen(url):",
                            style: TextStyle(color: Colors.amber),
                            textAlign: TextAlign.left,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            child: TextFormField(
                              controller: imgController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              autocorrect: false,
                              keyboardType: TextInputType.text,
                              decoration: textFormdecoration(
                                  prefIcon: const Icon(
                                Icons.image,
                                color: Colors.grey,
                              )),
                              onChanged: (value) {
                                login.img = value;
                                Preferences.img = value;
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Cambiar Contraseña :",
                            style: TextStyle(color: Colors.amber),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            child: TextFormField(
                              controller: passwordController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              autocorrect: false,
                              obscureText: ocultarPassword,
                              keyboardType: TextInputType.text,
                              decoration: textFormdecoration(
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
                                    : 'La contraseña debe tener mas de 8 caracteres';
                              },
                            ),
                          ),
                          Text(
                            "Repita la contraseña :",
                            style: TextStyle(color: Colors.amber),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 12, horizontal: 10),
                            child: TextFormField(
                              // controller: passwordController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              autocorrect: false,
                              obscureText: ocultarPassword,
                              keyboardType: TextInputType.text,

                              decoration: textFormdecoration(
                                prefIcon: const Icon(
                                  Icons.key,
                                  color: Colors.grey,
                                ),
                              ),

                              validator: (value) {
                                return (value == Preferences.password)
                                    ? null
                                    : 'La contraseña no coincide';
                              },
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            "Cambiar telefono:",
                            style: TextStyle(color: Colors.amber),
                            textAlign: TextAlign.start,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            child: TextFormField(
                              controller: telefonoController,
                              style: const TextStyle(
                                  color: Colors.black, fontSize: 14),
                              autocorrect: false,
                              keyboardType: TextInputType.number,
                              decoration: textFormdecoration(
                                  prefIcon: const Icon(
                                Icons.phone_android,
                                color: Colors.grey,
                              )),
                              onChanged: (value) {
                                login.telefono = value;
                                Preferences.telefono = value;
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
                                        if (!login.isValidForm()) {
                                          return;
                                        }
                                        guardarDatos();
                                        login.isLoading = true;
                                        await Future.delayed(
                                            const Duration(seconds: 2));

                                        login.isLoading = false;
                                        // ignore: use_build_context_synchronously
                                        Navigator.pushReplacementNamed(
                                            context, MyRoutes.rPerfil);
                                      },
                                child: (login.isLoading)
                                    ? const CircularProgressIndicator(
                                        color: Colors.white)
                                    : const Text('Guardar Cambios'),
                              ),
                            ),
                          ),
                        ],
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
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

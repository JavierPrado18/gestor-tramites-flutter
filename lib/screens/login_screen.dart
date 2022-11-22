import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/providers/index.dart';
import 'package:proyecto1/routes/route.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final login = Provider.of<ProviderLogin>(context);
    return Scaffold(
      backgroundColor: Colors.black,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.network(
                  'https://assets9.lottiefiles.com/packages/lf20_pbl690j5.json',
                  width: 300),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 30),
                decoration:
                          BoxDecoration( 
                            border: Border.all(width: 3,color:Color.fromRGBO(204, 213, 174,1) ),
                            borderRadius: BorderRadius.circular(20),
                            color:Color.fromRGBO(254, 250, 224,1),
                            
                            ),
                child: Form(
                    key: login.formKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            autocorrect: false,
                            keyboardType: TextInputType.emailAddress,
                            decoration: textFormdecoration(
                                hintText: 'dni@unmsm.edu.pe',
                                prefIcon: const Icon(
                                  Icons.email_outlined,
                                  color: Colors.grey,
                                )),
                            onChanged: (value) => login.email = value,
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
                          padding: const EdgeInsets.all(15),
                          child: TextFormField(
                            style: const TextStyle(color: Colors.black),
                            autocorrect: false,
                            obscureText: true,
                            keyboardType: TextInputType.text,
                            decoration: textFormdecoration(
                                hintText: '********',
                                prefIcon: const Icon(
                                  Icons.key,
                                  color: Colors.grey,
                                )),
                            onChanged: (value) => login.password = value,
                            validator: (value) {
                              return (value != null && value.length >= 8)
                                  ? null
                                  : 'Debe tener minimo 8 caracteres';
                            },
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 10),
                          child: SizedBox(
                            height: 40,
                            width: 220,
                            child: MaterialButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              disabledColor: Colors.green,
                              elevation: 1,
                              color: Colors.green,
                              onPressed: login.isLoading
                                  ? null
                                  : () async {
                                      FocusScope.of(context).unfocus();
                                      if (!login.isValidForm()) {
                                        return;
                                      }
                                      login.isLoading = true;
                                      await Future.delayed(
                                          const Duration(seconds: 2));

                                      login.isLoading = false;
                                      // ignore: use_build_context_synchronously
                                      Navigator.pushReplacementNamed(
                                          context, MyRoutes.rHome);
                                    },
                              child: (login.isLoading)
                                  ? const CircularProgressIndicator(
                                      color: Colors.white)
                                  : const Text('INGRESAR'),
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
    );
  }

  InputDecoration textFormdecoration(
      {final String? hintText, final Widget? prefIcon}) {
    return InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174,1)),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174,1)),
          borderRadius: BorderRadius.circular(15),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color:Color.fromRGBO(230, 57, 70,1)),
          borderRadius: BorderRadius.circular(15),
        ),
        border: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: Color.fromRGBO(204, 213, 174,1)),
          borderRadius: BorderRadius.circular(15),
        ),
        filled: true,
        fillColor: Color.fromARGB(192, 255, 255, 255),
        hintText: '${hintText}',
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: prefIcon,
        contentPadding: const EdgeInsets.all(10));
  }
}

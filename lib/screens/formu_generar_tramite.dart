import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';

class FormularioGenerarTramiteScreen extends StatelessWidget {
  const FormularioGenerarTramiteScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          Preferences.titulo,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          Text(
            'FormularioGenerarTramiteScreen',
          ),
        ],
      ),
    );
  }
}

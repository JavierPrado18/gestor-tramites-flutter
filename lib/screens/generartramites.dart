import 'package:flutter/material.dart';

import '../widgets/index.dart';

class GenerarTramitesScreen extends StatefulWidget {
  const GenerarTramitesScreen({Key? key}) : super(key: key);

  @override
  State<GenerarTramitesScreen> createState() => _GenerarTramitesScreenState();
}

class _GenerarTramitesScreenState extends State<GenerarTramitesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Generar Tramite',
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: DrawerST(),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomTextFieldScreen(
                initialValue: '',
                keyboardType: TextInputType.text,
                hintext: 'Nombre completo',
                prefixIcon: Icon(Icons.man),
                onChange: (value) {
                  setState(() {});
                },
              ),
              CustomTextFieldScreen(
                initialValue: '',
                keyboardType: TextInputType.text,
                hintext: 'Apellido completo',
                prefixIcon: Icon(Icons.man),
                onChange: (value) {
                  setState(() {});
                },
              ),
              CustomTextFieldScreen(
                initialValue: '',
                keyboardType: TextInputType.number,
                hintext: 'Celular',
                prefixIcon: Icon(Icons.phone),
                onChange: (value) {
                  setState(() {});
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

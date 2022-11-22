import 'package:flutter/material.dart';

import '../widgets/index.dart';

class GenerarTramitesScreen extends StatelessWidget {
  const GenerarTramitesScreen({Key? key}) : super(key: key);

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
      drawer: const DrawerST(),
      body: Column(
        children: const [
          SizedBox(
            height: 10,
          ),
          Text(
            'GenerarTramitesScreen',
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyecto1/widgets/index.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: const Text("UNMSM"),
        centerTitle: true,
      ),
      drawer: DrawerST(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Bienvenido al Sistema de Gestion de Tramites de la UNMSM',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 25),
            )
          ],
        ),
      ),
    ); //
  }
}

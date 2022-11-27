import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import '../widgets/index.dart';

class EstadoTramitesScreen extends StatelessWidget {
  const EstadoTramitesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Estado Tramites',
          style: Styles.appbarText,
        ),
        actions: [
          TextButton(
              onPressed: () {},
              child: const Text(
                '4',
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              )),
          const Icon(Icons.notifications),
        ],
        centerTitle: true,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: const [
              CustomCardScreen(
                titulo: 'Certificado de Estudios',
                fecha: '12 de Octubre 2022 - ',
                hora: '10:58 AM',
                estado: 'Recibido',
                colorFondo: Colors.yellow,
              ),
              CustomCardScreen(
                titulo: 'Título profesional',
                fecha: '01 de Noviembre 2022 - ',
                hora: '2:31 PM',
                estado: 'En Proceso',
                colorFondo: Colors.green,
              ),
              CustomCardScreen(
                titulo: 'Grado Académico de Bachiller',
                fecha: '12 de Noviembre 2022 - ',
                hora: '7:3 AM',
                estado: 'Aprobado',
                colorFondo: Colors.blue,
              ),
              CustomCardScreen(
                titulo: 'Certificado de Estudios',
                fecha: '29 de Noviembre 2022 - ',
                hora: '4:00 PM',
                estado: 'Finalizado',
                colorFondo: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

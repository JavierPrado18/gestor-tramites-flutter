import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/preferences/preference.dart';
import 'package:proyecto1/routes/route.dart';

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
        title: Text(
          'Generar Tramite',
          style: Styles.appbarText,
        ),
        centerTitle: true,
        elevation: 0,
      ),
      drawer: DrawerST(),
      body: ListView(
        children: [
          Card(
            child: ListTile(
              leading: const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1209500169/es/vector/icono-de-l%C3%ADnea-de-documentos-ilustraciones-vectoriales-de-p%C3%A1ginas-aisladas-en-blanco-las.jpg?s=612x612&w=is&k=20&c=g4t4zsteK-XS-RzLtpf-aygVWYWKKCXe0tUeWRF2y3M='),
              ),
              title: Text('Certificado de Estudios'),
              subtitle: Text('S./ 30 y expende en 3 días'),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Preferences.titulo = 'Certificado de Estudios';
                Navigator.pushNamed(
                    context, MyRoutes.rFormularioGenerarTramite);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1209500169/es/vector/icono-de-l%C3%ADnea-de-documentos-ilustraciones-vectoriales-de-p%C3%A1ginas-aisladas-en-blanco-las.jpg?s=612x612&w=is&k=20&c=g4t4zsteK-XS-RzLtpf-aygVWYWKKCXe0tUeWRF2y3M='),
              ),
              title: Text('Certificado de Egresado'),
              subtitle: Text('S./ 500 y expende en 5 días'),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Preferences.titulo = 'Certificado de Egresado';
                Navigator.pushNamed(
                    context, MyRoutes.rFormularioGenerarTramite);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1209500169/es/vector/icono-de-l%C3%ADnea-de-documentos-ilustraciones-vectoriales-de-p%C3%A1ginas-aisladas-en-blanco-las.jpg?s=612x612&w=is&k=20&c=g4t4zsteK-XS-RzLtpf-aygVWYWKKCXe0tUeWRF2y3M='),
              ),
              title: Text('Constancia de Ingreso'),
              subtitle: Text('S./ 10 y expende en 1 día'),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Preferences.titulo = 'Constancia de Ingreso';
                Navigator.pushNamed(
                    context, MyRoutes.rFormularioGenerarTramite);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1209500169/es/vector/icono-de-l%C3%ADnea-de-documentos-ilustraciones-vectoriales-de-p%C3%A1ginas-aisladas-en-blanco-las.jpg?s=612x612&w=is&k=20&c=g4t4zsteK-XS-RzLtpf-aygVWYWKKCXe0tUeWRF2y3M='),
              ),
              title: Text('Grado Académico de Bachiller'),
              subtitle: Text('S./ 1120 y expende en 50 días'),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Preferences.titulo = 'Grado Académico de Bachiller';
                Navigator.pushNamed(
                    context, MyRoutes.rFormularioGenerarTramite);
              },
            ),
          ),
          Card(
            child: ListTile(
              leading: const Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/id/1209500169/es/vector/icono-de-l%C3%ADnea-de-documentos-ilustraciones-vectoriales-de-p%C3%A1ginas-aisladas-en-blanco-las.jpg?s=612x612&w=is&k=20&c=g4t4zsteK-XS-RzLtpf-aygVWYWKKCXe0tUeWRF2y3M='),
              ),
              title: Text('Título profesional'),
              subtitle: Text('S./ 1120 y expende en 50 días'),
              trailing: Icon(Icons.arrow_circle_right_outlined),
              onTap: () {
                Preferences.titulo = 'Título profesional';
                Navigator.pushNamed(
                    context, MyRoutes.rFormularioGenerarTramite);
              },
            ),
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/screens/index.dart';
import 'package:proyecto1/widgets/index.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    //para cortar el usuario del correo
    final index =
        (Preferences.usuario != '') ? Preferences.usuario.indexOf("@") : 0;
    final usuario = (index > 0)
        ? Preferences.usuario.replaceRange(index, null, "")
        : 'User123';
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 112, 19, 22).withOpacity(0.8),
          title: const Text(
            "Perfil",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => ConfigScreem()));
                },
                icon: Icon(
                  Icons.settings,
                  color: Colors.white,
                ))
          ],
        ),
        drawer: DrawerST(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Stack(children: [
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 450),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(Preferences.img != ""
                              ? Preferences.img
                              : "https://images.pexels.com/photos/1438081/pexels-photo-1438081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                          fit: BoxFit.cover),
                    ),
                    height: 260,
                    alignment: Alignment.center,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 450),
                    decoration: BoxDecoration(
                      color: Color.fromRGBO(112, 25, 28, 1).withOpacity(.5),
                    ),
                    height: 250,
                    alignment: Alignment.center,
                  ),
                ),
                ClipPath(
                  clipper: WaveClipper(waveDeep: 0, waveDeep2: 100),
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 50),
                    color: Color.fromRGBO(112, 25, 28, 1).withOpacity(.3),
                    height: 200,
                    alignment: Alignment.center,
                  ),
                ),
                // ),
                Positioned(
                  bottom: 0,
                  right: 30,
                  child: CircleAvatar(
                    radius: 70,
                    backgroundColor: Color.fromRGBO(112, 25, 28, 1),
                    child: CircleAvatar(
                      backgroundImage: NetworkImage(Preferences.img != ""
                          ? Preferences.img
                          : "https://images.pexels.com/photos/1438081/pexels-photo-1438081.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2"),
                      radius: 63,
                    ),
                  ),
                ),
                Positioned(
                  top: 20,
                  left: 20,
                  child: Text(
                    usuario,
                    style: TextStyle(color: Colors.white, fontSize: 25),
                  ),
                )
              ]),
              Column(
                children: [
                  Text(
                    "Informacion",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  ListTile(
                    leading: Icon(Icons.email),
                    title: Text("Correo"),
                    subtitle: Text(Preferences.usuario),
                  ),
                  ListTile(
                    leading: Icon(Icons.science),
                    title: Text("Carrera"),
                    subtitle: Text("Ingenieria"),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone_android_outlined),
                    title: Text("telefono"),
                    subtitle: Text(Preferences.telefono),
                  ),
                  ListTile(
                    leading: Icon(Icons.book_rounded),
                    title: Text("Rol"),
                    subtitle: Text("Estudiante"),
                  ),
                ],
              )
            ],
          ),
        ));
  }
}

class WaveClipper extends CustomClipper<Path> {
  final double waveDeep;
  final double waveDeep2;

  WaveClipper({this.waveDeep = 100, this.waveDeep2 = 0});
  @override
  Path getClip(Size size) {
    final double sw = size.width;
    final double sh = size.height;

    final Offset controlPoint1 = Offset(sw * .25, sh - waveDeep2 * 2);
    final Offset destinationPoint1 = Offset(sw * .5, sh - waveDeep - waveDeep2);

    final Offset controlPoint2 = Offset(sw * .75, sh - waveDeep * 2);
    final Offset destinationPoint2 = Offset(sw, sh - waveDeep);

    final Path path = Path()
      ..lineTo(0, size.height - waveDeep2)
      ..quadraticBezierTo(controlPoint1.dx, controlPoint1.dy,
          destinationPoint1.dx, destinationPoint1.dy)
      ..quadraticBezierTo(controlPoint2.dx, controlPoint2.dy,
          destinationPoint2.dx, destinationPoint2.dy)
      ..lineTo(size.width, 0)
      ..lineTo(0, 0)
      ..close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false; //if new instance have different instance than old instance
    //then you must return true;
  }
}

import 'package:flutter/material.dart';

class CustomCardScreen extends StatelessWidget {
  final String titulo;
  final String fecha;
  final String hora;
  final String estado;
  final Color? colorFondo;

  const CustomCardScreen(
      {super.key,
      required this.titulo,
      required this.fecha,
      required this.hora,
      required this.estado,
      this.colorFondo});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: colorFondo,
      elevation: 1,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(15)),
        side: BorderSide(
          // color: Theme.of(context).colorScheme.outline,
          color: Colors.transparent,
        ),
      ),
      child: SizedBox(
        width: 300,
        height: 100,
        child: Stack(
          children: [
            Card(
              color: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15)),
                side: BorderSide(color: Colors.black),
              ),
              child: SizedBox(
                  width: 300,
                  height: 50,
                  child: Padding(
                    padding: const EdgeInsets.all(3.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          titulo,
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.home,
                              color: Colors.white,
                              size: 14,
                            ),
                            Text(
                              fecha,
                              style: TextStyle(color: Colors.white),
                            ),
                            Text(
                              hora,
                              style: TextStyle(color: Colors.white),
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(3.0),
              child: Column(
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Estado :',
                        style: TextStyle(
                          color: Colors.black87,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        estado,
                        style: TextStyle(
                            color: Colors.black87,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

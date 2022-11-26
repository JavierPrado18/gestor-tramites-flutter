import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:proyecto1/widgets/index.dart';

class HomeScreem extends StatefulWidget {
  const HomeScreem({super.key});

  @override
  State<HomeScreem> createState() => _HomeScreemState();
}

class _HomeScreemState extends State<HomeScreem> {
  //lista de noticias
  List<Object> news = [
    {
      "new": "UNMSM conmemora el 80.º aniversario del Código Civil Italiano",
      "img":
          "https://biologia-unmsm.s3.us-east-2.amazonaws.com/01_c8b7ee6c36.jpg",
    },
    {
      "new": "Presentación del libro: La música del Perú",
      "img":
          "https://biologia-unmsm.s3.us-east-2.amazonaws.com/presentacion_libro_La_musica_del_Peru_c308a8eaf2.png",
    },
    {
      "new":
          "Conversatorio virtual sobre la exposición «Se multiplican llamativas, las hermanas agudas»",
      "img":
          "https://biologia-unmsm.s3.us-east-2.amazonaws.com/conversatorio_se_multiplican_llamativa_d878b65db4.jpg",
    },
    {
      "new":
          "Entregan a San Marcos tres colecciones de libros de la Biblioteca Bicentenario",
      "img":
          "https://biologia-unmsm.s3.us-east-2.amazonaws.com/01_9fa05f496a.jpg",
    },
    {
      "new":
          "Promueven el liderazgo e intercambio estudiantil con programa Sanmarquinos para el Perú 2022",
      "img":
          "https://biologia-unmsm.s3.us-east-2.amazonaws.com/1_f9022075d2.jpg",
    },
  ];

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
              'Gestion de Tramites de la UNMSM',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                  "Te damos la bienvenida al portal  donde podras realizar tus trámites de forma sencilla y rápida.",
                  style: TextStyle( fontSize: 20,fontWeight: FontWeight.w300,),textAlign: TextAlign.justify,),
            ),
            
            SizedBox(height: 35,),
            Text("NOTICIAS",style: TextStyle(color: Colors.white, fontSize: 30,fontWeight: FontWeight.bold),), 
            SizedBox(height: 20,),

            //llamamos el carusel
            CarouselSlider(
                //mapeamos la lista
                items: news.map((e) {
                  return buildView(context, e);
                }).toList(),
                options: CarouselOptions(
                  height: 300,
                  autoPlay: true,
                  autoPlayAnimationDuration: Duration(seconds: 1),
                  autoPlayCurve: Curves.easeInOut,
                ))
          ],
        ),
      ),
    ); //
  }

  Widget buildView(BuildContext context, e) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        image:
            DecorationImage(image: NetworkImage(e["img"]), fit: BoxFit.cover),
      ),
      child: Container(
        height: 20,
        alignment: Alignment.bottomCenter,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color.fromARGB(110, 255, 255, 255),
        ),
        child: Text(e["new"],
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Color.fromRGBO(112, 25, 28, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20)),
      ),
    );
  }
}

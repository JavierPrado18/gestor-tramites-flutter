import 'package:flutter/material.dart';
import 'package:proyecto1/screens/index.dart';
import 'package:proyecto1/widgets/index.dart';

class PerfilScreen extends StatelessWidget {
  const PerfilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
      AppBar(
        backgroundColor: Color.fromRGBO(112, 25, 28,1),
        title: const Text("Perfil",style: TextStyle(color: Colors.white),),
        centerTitle: true,
       
        actions: [
          IconButton(onPressed:() {
             Navigator.push(
              context, MaterialPageRoute(builder: (context) => ConfigScreem()));
          }, icon:Icon(Icons.settings,color: Colors.white,))
        ],),
      drawer: const DrawerST(),
      body: SingleChildScrollView(
        child: Column(children: [
          Container(
            decoration: BoxDecoration(
              color:Color.fromRGBO(112, 25, 28,1),
              borderRadius: BorderRadius.only(bottomLeft:Radius.circular(40),bottomRight:Radius.circular(40)),
              
              ),
            width: double.infinity,
          
            child:Column(
              children:const [
                CircleAvatar(
                  backgroundImage: NetworkImage("https://img.freepik.com/vector-premium/gato-gafas-geek-trabajando-ilustracion-vector-dibujos-animados-mascota-animal-programador-oficina-tecnologia-portatil_7102-687.jpg?w=2000"),
                  radius: 80,
                ),
                SizedBox(height: 20,),
                Text("developer@mail.com",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white),),
                Text("meow el programador",style: TextStyle(color: Colors.white),),
                SizedBox(height: 20,)
              ],
            ) ,
          ),
          SizedBox(height: 20,),
          Column(
            children: [
              Text("Informacion",style: TextStyle(fontSize: 20 ,fontWeight: FontWeight.bold),),
              ListTile(
                leading: Icon(Icons.person),
                title: Text("Nombre"),
                subtitle: Text("Meow  Teem Roket "),
                
                
              ),
              ListTile(
                leading: Icon(Icons.science),
                title: Text("Carrera"),
                subtitle: Text("Ingenieria"),
              ),
              ListTile(
                leading: Icon(Icons.email),
                title: Text("Email"),
                subtitle: Text("developer@mail.com"),
              ),
              ListTile(
                leading: Icon(Icons.book_rounded),
                title: Text("Condicion"),
                subtitle: Text("Estudiante"),
              ),
      
            ],
          )
        ],),
      )
    );
  }
}
import 'package:flutter/material.dart';
import 'package:proyecto1/screens/config_screen.dart';
import 'package:proyecto1/widgets/index.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("UNIVERSIDAD"),

      ),
      drawer: const DrawerST(),
      body: Center(
        

        //solo para que me lleve a config
        child: MaterialButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: ((context) => const ConfigScreem())));
          },
          child: const Text("settings"),
          color: Colors.amber,
        ),
      ),
      //drawer: Drawer(
      //  child: ListView(          
      //    children: <Widget> [               
      //     const  UserAccountsDrawerHeader(
      //       accountName: Text('Universidad'),
      //       accountEmail: Text('Universidad@gmail.com'),
      //       currentAccountPicture: CircleAvatar(
      //        backgroundColor: Color.fromARGB(255, 47, 153, 5),
      //        child: Text(
      //          'U',
      //          style: TextStyle(fontSize: 50),
      //          ),
      //        ),
      //       ),
      //       ListTile(
      //        title: Text('Perfil'),
      //        leading: Icon(Icons.person),
      //        onTap: (){},
      //      ),
      //      Container(
      //        child: ListTile(
      //          title: Text('Tramites'),
      //          leading: Icon(Icons.description),
      //          onTap: (){},
      //        ),
      //        
      //      ),
      //      ListTile(
      //        title: Text('Configuraciones'),
      //        leading: Icon(Icons.settings),
      //        onTap: (){},
      //      ),
      //      ListTile(
      //        title: Text('Cerrar Sesion'),
      //        leading: Icon(Icons.verified),
      //        onTap: (){},
      //      ),
      //       ListTile(
      //        title: Text('Acerca'),
      //        leading: Icon(Icons.info),
      //        onTap: (){},
      //      ),
      //    ],
      //    
      //  ),
      //  
      //),
      //
    );//
    
  }
}

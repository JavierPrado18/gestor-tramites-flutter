import 'package:flutter/material.dart';
import 'package:proyecto1/screens/config_screen.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const  Text("home"),
      ),
      body: Center(
        //solo para que me lleve a config
        child: MaterialButton(onPressed: () {
          Navigator.push(context, 
            MaterialPageRoute(builder: 
            ((context) =>const ConfigScreem() )
            ));
        },
        child:const Text("settings"),
        color: Colors.amber,
        ),
      ),
    );
  }
}
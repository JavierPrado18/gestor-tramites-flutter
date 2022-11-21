import 'package:flutter/material.dart';
import 'package:proyecto1/screens/config_screen.dart';
import 'package:proyecto1/widgets/index.dart';

class HomeScreem extends StatelessWidget {
  const HomeScreem({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("home"),
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
    );
  }
}

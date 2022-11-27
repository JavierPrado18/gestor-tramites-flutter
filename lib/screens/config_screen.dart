import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/index.dart';
import 'package:proyecto1/screens/editar_usuario.dart';
import 'package:proyecto1/widgets/drawer.dart';
import 'package:settings_ui/settings_ui.dart';

class ConfigScreem extends StatefulWidget {
  const ConfigScreem({super.key});

  @override
  State<ConfigScreem> createState() => _ConfigScreemState();
}

class _ConfigScreemState extends State<ConfigScreem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 25, 28, 1),
        title: const Text(
          "Configuraciones",
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      drawer: DrawerST(),
      body: SettingsList(
        sections: [
          SettingsSection(title: const Text('Cuenta'), tiles: <SettingsTile>[
            SettingsTile.navigation(
              leading: const Icon(Icons.lock_person_rounded),
              title: const Text('Actualizar datos'),
              onPressed: (context) => {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => EditUsuarioScreen()))
              },
            ),
          ]),
          SettingsSection(
            title: const Text('Pantalla'),
            tiles: <SettingsTile>[
              SettingsTile.switchTile(
                onToggle: (value) {
                  Preferences.theme = value;
                  final themeP =
                      Provider.of<ThemeProvider>(context, listen: false);
                  value ? themeP.setOscuro() : themeP.setClaro();
                  setState(() {});
                },
                initialValue: Preferences.theme,
                leading: Icon(Icons.dark_mode_sharp),
                title: Text('Modo oscuro'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/index.dart';
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
      appBar: AppBar(title: const Text("Settings"), actions: [
        Switch.adaptive(
            value: Preferences.theme,
            onChanged: (value) {
              Preferences.theme = value;
              final themeP = Provider.of<ThemeProvider>(context, listen: false);
              value ? themeP.setOscuro() : themeP.setClaro();
              setState(() {});
            })
      ]),
      drawer: const DrawerST(),
      body: SettingsList(
        sections: [
          SettingsSection(
            title: const Text('Contraseña'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.lock_person_rounded),
                title: const Text('Cambiar Contraseña'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

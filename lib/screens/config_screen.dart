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
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(112, 25, 28,1),
        title: const Text("Settings"), 
        centerTitle: true,
      ),
      drawer: const DrawerST(),
      body: SettingsList(
        sections: [
          SettingsSection(

            title: const Text('Cuenta'),
            tiles: <SettingsTile>[
              SettingsTile.navigation(
                leading: const Icon(Icons.lock_person_rounded),
                title: const Text('Cambiar Contraseña'),
                onPressed: (context) =>{},
              ),
              SettingsTile.navigation(
                leading: const Icon(Icons.person),
                title: const Text('Cambiar foto'),
              ),
              ]),
              
          
          SettingsSection(
            title: const Text('Pantalla'),
            tiles: <SettingsTile>[
              
              SettingsTile.switchTile(
              onToggle: (value) {
                Preferences.theme = value;
              final themeP = Provider.of<ThemeProvider>(context, listen: false);
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
class DialogExample extends StatelessWidget {
  const DialogExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AlertDialog Sample')),
      body: Center(
        child: OutlinedButton(
          onPressed: () {
            Navigator.of(context).restorablePush(_dialogBuilder);
          },
          child: const Text('Open Dialog'),
        ),
      ),
    );
  }

  static Route<Object?> _dialogBuilder(
      BuildContext context, Object? arguments) {
    return DialogRoute<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Basic dialog title'),
          content: const Text('A dialog is a type of modal window that\n'
              'appears in front of app content to\n'
              'provide critical information, or prompt\n'
              'for a decision to be made.'),
          actions: <Widget>[
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Disable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.labelLarge,
              ),
              child: const Text('Enable'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}


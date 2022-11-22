import 'package:flutter/material.dart';

import 'package:proyecto1/screens/index.dart';

class MyRoutes {
  static const String rHome = '/home';

  static const String rPerfil = '/perfil';

  static const String rAjustes = '/ajustes';
  static const String rLogin = '/login';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeScreem());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const HomeScreem());
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ('/ajustes'):
        return MaterialPageRoute(
            builder: (_) =>
                const ConfigScreem()); //subguion en lugar de poner context

      default:
        return MaterialPageRoute(builder: (_) => const HomeScreem());
    }
  }
}

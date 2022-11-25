import 'package:flutter/material.dart';
import 'package:proyecto1/screens/index.dart';
import 'package:proyecto1/screens/recuperar_screen.dart';

class MyRoutes {
  static const String rHome = '/home';

  static const String rPerfil = '/perfil';

  static const String rAjustes = '/ajustes';
  static const String rLogin = '/login';
  static const String rCuentaNueva = '/cuentaNueva';
  static const String rRecuperar = '/recuperar';
  static const String rError = '/error';
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case ('/home'):
        return MaterialPageRoute(builder: (_) => const HomeScreem());
      case ('/perfil'):
        return MaterialPageRoute(builder: (_) => const PerfilScreen());
      case ('/login'):
        return MaterialPageRoute(builder: (_) => const LoginScreen());
      case ('/cuentaNueva'):
        return MaterialPageRoute(builder: (_) => const CrearUsuarioScreen());
      case ('/recuperar'):
        return MaterialPageRoute(builder: (_) => const RecuperarScreen());
      case ('/ajustes'):
        return MaterialPageRoute(
            builder: (_) =>
                const ConfigScreem());
      case ('/editarUsuario'):
        return MaterialPageRoute(
            builder: (_) =>
                const EditUsuarioScreen()); //subguion en lugar de poner context

      default:
        return MaterialPageRoute(builder: (_) => const ErrorScreen());
    }
  }
}

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:proyecto1/preferences/index.dart';
import 'package:proyecto1/providers/index.dart';
import 'package:proyecto1/routes/route.dart';
import 'package:proyecto1/services/notification_services.dart';
import 'package:proyecto1/services/services_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Preferences.init();

  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(
        create: (context) => ThemeProvider(isDartMode: Preferences.theme),
      ),
      ChangeNotifierProvider(
        create: (_) => ProviderLogin(),
      ),
      ChangeNotifierProvider(
        create: (_) => AuthService(),
      )
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      scaffoldMessengerKey: NotificationServices.messengerKey,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: Provider.of<ThemeProvider>(context).currentTheme,
      onGenerateRoute: MyRoutes.generateRoute,
      initialRoute: MyRoutes.rGenerarTramite,
      //home: HomeScreem(),
    );
  }
}

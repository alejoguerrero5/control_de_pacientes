import 'package:flutter/material.dart';

import 'package:control_de_pacientes/src/routes/routes.dart';
import 'package:control_de_pacientes/src/preferencias_usuario/preferencias_usuario.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final prefs = new PreferenciasUsuario();
  await prefs.initPrefs();

  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool usuarioLogueado = false;

  @override
  Widget build(BuildContext context) {
    final _prefs = new PreferenciasUsuario();
    _prefs.token == '' ? usuarioLogueado = false : usuarioLogueado = true;

    return MaterialApp(
      title: 'Control de Pacientes',
      debugShowCheckedModeBanner: false,
      initialRoute: usuarioLogueado ? 'home_logueado' : 'home',
      onGenerateRoute: RouteGenerator.generateRoute,
      theme: ThemeData(
        primaryColor: Colors.greenAccent,
      ),
    );
  }
}

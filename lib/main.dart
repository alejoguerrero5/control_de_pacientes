import 'package:flutter/material.dart';

import 'package:control_de_pacientes/src/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Control de Pacientes',
      debugShowCheckedModeBanner: false,
      initialRoute: 'home',
      routes: getApplicationRoutes(),
      theme: ThemeData(primaryColor: Colors.greenAccent),
    );
  }
}

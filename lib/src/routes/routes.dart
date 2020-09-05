import 'package:flutter/material.dart';

import 'package:control_de_pacientes/src/pages/home.dart';
import 'package:control_de_pacientes/src/pages/registro.dart';
import 'package:control_de_pacientes/src/pages/ingreso.dart';
import 'package:control_de_pacientes/src/pages/home_logueado.dart';
import 'package:control_de_pacientes/src/pages/paciente.dart';

/* Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
    'ingreso': (BuildContext context) => IngresoPage(),
    'registro': (BuildContext context) => RegistroPage(),
    'home_logueado': (BuildContext context) => HomeLogueadoPage(),
    'paciente': (BuildContext context) => PacientePage(),
  };
} */

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case 'home':
        return MaterialPageRoute(builder: (_) => HomePage());
      case 'ingreso':
        return MaterialPageRoute(builder: (_) => IngresoPage());
      case 'registro':
        return MaterialPageRoute(builder: (_) => RegistroPage());
      case 'home_logueado':
        return MaterialPageRoute(builder: (_) => HomeLogueadoPage());
      case 'paciente':
        return MaterialPageRoute(builder: (_) => PacientePage(data: args));
    }

    return MaterialPageRoute(builder: (_) => HomePage());
  }
}

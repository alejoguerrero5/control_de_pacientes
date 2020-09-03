import 'package:control_de_pacientes/src/pages/home.dart';
import 'package:flutter/material.dart';

Map<String, WidgetBuilder> getApplicationRoutes() {
  return <String, WidgetBuilder>{
    'home': (BuildContext context) => HomePage(),
  };
}

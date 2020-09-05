//import 'dart:convert';

//import 'package:http/http.dart' as http;

import 'package:control_de_pacientes/src/preferencias_usuario/preferencias_usuario.dart';

class UsuarioProvider {
  nuevoUsuario() {
    // Solicitud POST a servidor
    // final resp = await http.post(https//:, body json.encode)
    // Map<String, dynamic> decodeResp = json.decode(resp);

    final String token =
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiJhbGVqb2d1ZXJyZXJvNUBnbWFpbC5jb20iLCJqdGkiOiJhMzgwZjc3OS0xYmMyLTQ1MzEtYWU4Mi03NDk2NGJjYjE3ZWYiLCJpYXQiOjE1OTkyNDQ4NjMsImlkIjoiMjAyMDA5MDQ0MDQzX0lXTyIsIm5hbWUiOiJhbGVqYW5kcm8iLCJsYXN0TmFtZSI6Imd1ZXJyZXJvIiwidXNlck5hbWUiOiJhbGVqb2d1ZXJyZXJvNUBnbWFpbC5jb20iLCJuYmYiOjE1OTkyNDQ4NjMsImV4cCI6MTU5OTI0NjY2MywiaXNzIjoid2ViQXBpIiwiYXVkIjoiaHR0cDovL3d3dy5ndWVycmVyb2FwcHMuY29tIn0.dEqEEtdzNhaqBbxQFMqE_VvddXLDbHCXSwynHGeKPKY';

    final _prefs = new PreferenciasUsuario();

    _prefs.token = token;

    return token;
  }

  guardarNombre(nombre) {
    final _prefs = new PreferenciasUsuario();

    _prefs.nombre = nombre;
  }

  guardarEmail(email) {
    final _prefs = new PreferenciasUsuario();

    _prefs.email = email;
  }

  borrarUsuario() {
    final String token = '';
    final _prefs = new PreferenciasUsuario();

    _prefs.token = token;
  }
}

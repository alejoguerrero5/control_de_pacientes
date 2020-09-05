import 'package:flutter/material.dart';

import 'package:control_de_pacientes/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:control_de_pacientes/src/providers/usuario_provider.dart';

class RegistroPage extends StatefulWidget {
  @override
  _RegistroPageState createState() => _RegistroPageState();
}

class _RegistroPageState extends State<RegistroPage> {
  final usuarioProvider = new UsuarioProvider();
  final _prefs = new PreferenciasUsuario();

  String _nombre = '';
  bool _validateNombre = false;
  String _email = '';
  bool _validateEmail = false;
  String _errorEmail = '';
  String _password = '';
  bool _validatePassword = false;
  String _repeatPassword = '';
  bool _validateRepeatPassord = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Registro'),
        ),
        body: Center(
          child: _loguinForm(context),
        ));
  }

  _loguinForm(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5.0),
                boxShadow: <BoxShadow>[
                  BoxShadow(
                    color: Colors.black,
                    blurRadius: 3.0,
                    offset: Offset(0.0, 10.0),
                    spreadRadius: 3.0,
                  )
                ]),
            child: Column(
              children: [
                Text(
                  'Registrate',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                _inputNombre(),
                Divider(),
                _inputEmail(),
                Divider(),
                _inputPassword(),
                Divider(),
                _inputRepeatPassword(),
                Divider(),
                _crearBoton(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  _inputNombre() {
    return Container(
      child: TextField(
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Nombre',
            labelText: 'Nombre',
            helperText: 'Ej: Armando Areiza',
            errorText: _validateNombre ? 'Introduza Nombre' : null,
            suffix: Icon(Icons.create),
            icon: Icon(Icons.account_circle)),
        onChanged: (valor) => _nombre = valor,
      ),
    );
  }

  _inputEmail() {
    return Container(
      child: TextField(
          keyboardType: TextInputType.emailAddress,
          textCapitalization: TextCapitalization.words,
          decoration: InputDecoration(
              border:
                  OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
              hintText: 'Email',
              labelText: 'Email',
              errorText: _validateEmail ? _errorEmail : null,
              suffix: Icon(Icons.contact_mail),
              icon: Icon(Icons.email)),
          onChanged: (valor) => _email = valor),
    );
  }

  _inputPassword() {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Contraseña',
            labelText: 'Contraseña',
            errorText: _validatePassword ? 'minimo 6 caracteres' : null,
            suffix: Icon(Icons.lock),
            icon: Icon(Icons.lock_outline)),
        onChanged: (valor) => _password = valor,
      ),
    );
  }

  _inputRepeatPassword() {
    return Container(
      child: TextField(
        obscureText: true,
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(20.0)),
            hintText: 'Repetir Contraseña',
            labelText: 'Repetir Contraseña',
            errorText: _validateRepeatPassord
                ? 'Las contraseñas deben ser iguales'
                : null,
            suffix: Icon(Icons.lock),
            icon: Icon(Icons.lock_outline)),
        onChanged: (valor) => _repeatPassword = valor,
      ),
    );
  }

  _crearBoton() {
    return RaisedButton(
      child: Container(
        child: Text('Registrarse'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.greenAccent,
      onPressed: () {
        validations();
      },
    );
  }

  validations() {
    _nombre == '' ? _validateNombre = true : _validateNombre = false;
    _email.contains('@') ? _validateEmail = false : _validateEmail = true;
    _password.length < 6 ? _validatePassword = true : _validatePassword = false;
    _repeatPassword != _password
        ? _validateRepeatPassord = true
        : _validateRepeatPassord = false;

    if (_prefs.email == _email) {
      _validateEmail = true;
      _errorEmail = 'Correo ya registrado';
    } else {
      _validateEmail = false;
    }

    setState(() {});

    if (!_validateNombre &&
        !_validateEmail &&
        !_validatePassword &&
        !_validateRepeatPassord) {
      usuarioProvider.nuevoUsuario();
      usuarioProvider.guardarNombre(_nombre);
      usuarioProvider.guardarEmail(_email);
      Navigator.pushReplacementNamed(context, 'home_logueado');
    }
  }
}

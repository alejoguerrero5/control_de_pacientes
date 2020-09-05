import 'package:flutter/material.dart';

import 'package:control_de_pacientes/src/preferencias_usuario/preferencias_usuario.dart';
import 'package:control_de_pacientes/src/providers/usuario_provider.dart';

class IngresoPage extends StatefulWidget {
  @override
  _IngresoPageState createState() => _IngresoPageState();
}

class _IngresoPageState extends State<IngresoPage> {
  final usuarioProvider = new UsuarioProvider();
  final _prefs = new PreferenciasUsuario();

  String _email = '';
  String _errorEmail = '';
  String _password = '';
  bool _validatePassword = false;
  bool _validateEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Ingreso'),
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
                  'Ingresa',
                  style: TextStyle(fontSize: 20.0),
                ),
                SizedBox(
                  height: 20.0,
                ),
                _inputEmail(),
                Divider(),
                _inputPassword(),
                Divider(),
                _crearBoton(),
              ],
            ),
          ),
        ],
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
        onChanged: (valor) => setState(() {
          _email = valor;
        }),
      ),
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
            errorText:
                _validatePassword ? 'Introduzca contraseña valida' : null,
            suffix: Icon(Icons.lock),
            icon: Icon(Icons.lock_outline)),
        onChanged: (valor) => setState(() {
          _password = valor;
        }),
      ),
    );
  }

  _crearBoton() {
    return RaisedButton(
      child: Container(
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5.0)),
      color: Colors.greenAccent,
      onPressed: () {
        validations();
      },
    );
  }

  validations() {
    //_email.contains('@') ? _validateEmail = false : _validateEmail = true;
    if (_prefs.email != _email) {
      _validateEmail = true;
      _errorEmail = 'Correo no registrado en dispositivo';
    } else if (_prefs.email == _email) {
      _validateEmail = false;
    }
    _password.length < 6 ? _validatePassword = true : _validatePassword = false;

    if (!_validateEmail && !_validatePassword) {
      Navigator.pushReplacementNamed(context, 'home_logueado');
      usuarioProvider.nuevoUsuario();
    }

    setState(() {});
  }

/*   Future<String> loguinPOST(String email, String password, String nombre) async {
    var res = await http.post(
      "$SERVER_IP/login",
      body: {
        "username": email,
        "password": password,
        "nombre": nombre,
      }
    );
    if(res.statusCode == 200) return res.body;
    return null;
  }

  Future<int> registrarsePOST(String email, String password, String nombre) async {
    var res = await http.post(
      '$SERVER_IP/signup',
      body: {
        "username": email,
        "password": password,
        "nombre": nombre,
      }
    );
    return res.statusCode;
    
  }

  ingresar(String _email, String _password)async{
    var jwt = await loguinPOST(_email, _password);
                if(jwt != null) {
                  storage.write(key: "jwt", value: jwt);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => HomePage.fromBase64(jwt)
                    )
                  );
                } else {
                  displayDialog(context, "An Error Occurred", "No account was found matching that username and password");
                }
  } */

}

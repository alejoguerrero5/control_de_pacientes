import 'package:flutter/material.dart';
import 'dart:async';

import 'package:control_de_pacientes/src/providers/data_provider.dart';
import 'package:control_de_pacientes/src/providers/usuario_provider.dart';

class HomeLogueadoPage extends StatefulWidget {
  @override
  _HomeLogueadoPageState createState() => _HomeLogueadoPageState();
}

class _HomeLogueadoPageState extends State<HomeLogueadoPage> {
  ScrollController _scrollController = new ScrollController();
  final usuarioProvider = new UsuarioProvider();

  List<int> _listaNumeros = new List();
  int _ultimoNumero = 0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _agregar5();

    _scrollController.addListener(() {
      //Ver si esta abajo del todo segun pixeles
      if (_scrollController.position.pixels ==
          _scrollController.position.maxScrollExtent) {
        //_agregar10();
        fetchData();
      }
    });
  }

  //Eliminar todo al salir de la pantalla
  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Listas'),
        actions: [
          FlatButton(
            child: Column(
              children: [
                Text('Cerrar Sesión'),
                Icon(
                  Icons.exit_to_app,
                  color: Colors.black,
                )
              ],
            ),
            onPressed: () {
              usuarioProvider.borrarUsuario();
              Navigator.pushReplacementNamed(context, 'home');
            },
          )
        ],
      ),
      body: Stack(
        children: <Widget>[
          _crearLista(),
          _crearLoading(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: Colors.greenAccent,
        onPressed: () {},
      ),
    );
  }

  Widget _crearLista() {
    return FutureBuilder(
      future: dataProvider.cargarData(),
      initialData: [Text('Cargando Pacientes')],
      builder: (BuildContext context, AsyncSnapshot<List<dynamic>> snapshot) {
        return ListView(
          children: crearTarjeta(snapshot.data),
        );
      },
    );
  }

  List<Widget> crearTarjeta(List<dynamic> data) {
    final List<Widget> pacientes = [];

    data.forEach((element) {
      final widgetTemp = Card(
        elevation: 5.0,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        child: Column(
          children: [
            ListTile(
              leading: Icon(
                Icons.contacts,
                color: Colors.green,
              ),
              title: Text('${element['nombre']}'),
              subtitle: Text(
                  'Edad: ${element['edad']}\nUltima Cita: ${element['ultima_cita']}'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FlatButton(
                  child: Text('Ver Paciente'),
                  onPressed: () {
                    Navigator.pushNamed(context, 'paciente',
                        arguments: element);
                  },
                ),
              ],
            )
          ],
        ),
      );

      pacientes.add(widgetTemp);
    });

    return pacientes;
  }

  void _agregar5() {
    for (var i = 0; i < 5; i++) {
      _ultimoNumero++;
      _listaNumeros.add(_ultimoNumero);
    }

    setState(() {});
  }

  Future<Null> fetchData() async {
    _isLoading = true;
    setState(() {});

    final duration = new Duration(seconds: 2);
    new Timer(duration, respuestaHttp);
  }

  void respuestaHttp() {
    _isLoading = false;

    // Bajar un poco el scroll
    _scrollController.animateTo(_scrollController.position.pixels + 200,
        curve: Curves.fastOutSlowIn, duration: Duration(milliseconds: 250));

    _agregar5();
  }

  Widget _crearLoading() {
    if (_isLoading) {
      return Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.end,
        children: <Widget>[
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[CircularProgressIndicator()]),
          SizedBox(
            height: 15.0,
          )
        ],
      );
    } else {
      return Container();
    }
  }
}

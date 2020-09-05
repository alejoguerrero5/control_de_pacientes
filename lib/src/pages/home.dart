import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        centerTitle: true,
      ),
      body: _crearInicio(context),
    );
  }

  _crearInicio(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ListTile(
          title: Text(
            'Ingresa para tener el control de tus pacientes. Verificar el avance y datos generales de cada cita',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          height: 20,
        ),
        Image(image: AssetImage("assets/doctor.png")),
        _crearBotones(context),
        SizedBox(
          height: 20,
        )
      ],
    );
  }

  _crearBotones(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            FloatingActionButton(
              heroTag: 'btn1',
              child: Icon(Icons.assignment_ind),
              onPressed: () {
                Navigator.pushNamed(context, 'ingreso');
              },
              backgroundColor: Colors.greenAccent,
            ),
            Text('Ingresa')
          ],
        ),
        Column(
          children: [
            FloatingActionButton(
              heroTag: 'btn2',
              child: Icon(Icons.person_add),
              onPressed: () {
                Navigator.pushNamed(context, 'registro');
              },
              backgroundColor: Colors.greenAccent,
            ),
            Text('Registrate'),
          ],
        ),
      ],
    );
  }
}

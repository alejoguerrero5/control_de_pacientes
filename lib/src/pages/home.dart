import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Inicio'),
        centerTitle: true,
      ),
      body: Column(
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
          FloatingActionButton(
            child: Text('Ingresa'),
            onPressed: () {},
            backgroundColor: Colors.greenAccent,
            //shape: StadiumBorder(),
          ),
          SizedBox(
            height: 20,
          )
        ],
      ),
    );
  }
}

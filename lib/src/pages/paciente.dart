import 'package:flutter/material.dart';

class PacientePage extends StatelessWidget {
  final data;

  PacientePage({
    Key key,
    @required this.data,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Paciente'),
        ),
        body: Center(
          child: _crearPaciente(),
        ));
  }

  _crearPaciente() {
    final card = Container(
      height: 300.0,
      padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
      child: Column(
        children: [
          SizedBox(
            height: 20.0,
          ),
          Text(
            '${data['nombre']}',
            style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
          ),
          Text(
            'cc: ${data['cedula']}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20.0,
          ),
          Text(
            'Ultima Cita: ${data['ultima_cita']}',
            style: TextStyle(fontSize: 15.0, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 10,
          ),
          Column(children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Edad: '), Text('${data['edad']} años')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Peso: '), Text('${data['peso']} Kg')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Presión Arterial: '),
                Text('${data['presion_arterial']}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Frecuencia Cardiaca: '),
                Text('${data['frecuencia_cardiaca']}')
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [Text('Saturacion: '), Text('${data['saturacion']}')],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Frecuencia Respiratoria: '),
                Text('${data['frecuencia_respiratoria']}')
              ],
            ),
          ])
        ],
      ),
    );

    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
          color: Colors.white,
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black26,
                blurRadius: 10.0,
                spreadRadius: 4.0,
                offset: Offset(2.0, 5.0)),
          ]),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(30.0),
        child: card,
      ),
    );
  }
}

import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';

class _DataProvider {
  List<dynamic> pacientes = [];

  _DataProvider() {
    //cargarData();
  }

  Future<List<dynamic>> cargarData() async {
    final resp = await rootBundle.loadString('data/pacientes_data.json');

    Map dataMap = json.decode(resp);
    pacientes = dataMap['pacientes'];

    return pacientes;
  }
}

final dataProvider = new _DataProvider();

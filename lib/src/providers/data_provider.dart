import 'dart:io';

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

  guardarData(String key, String value) async {
    File jsonFile = new File('data/pacientes_data.json');
    final resp = await rootBundle.loadString('data/pacientes_data.json');
    Map dataMap = json.decode(resp);

    dataMap['pacientes'].addAll({key: value});
    jsonFile.writeAsStringSync(json.encode(dataMap));
  }
}

final dataProvider = new _DataProvider();

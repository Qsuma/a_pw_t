// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:app_tesis_yaliana/models/Student.dart';
import 'package:app_tesis_yaliana/utils/preferencias_usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../helpers/debouncer.dart';

class EstudianteProvider extends ChangeNotifier {
  final Dio dio = Dio();
  final prefs = PreferenciasDeUsuario();

  final _baseURL = '192.168.150.65/core/api/v1/';

  List<Estudiante> estudiantes = [];
  int page = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Estudiante>> _suggestionStreamController =
      StreamController.broadcast();

  Stream<List<Estudiante>> get suggestionStream =>
      _suggestionStreamController.stream;
  EstudianteProvider();

  _postEstudiante(Map<String, dynamic> data) async {
    final prefs = PreferenciasDeUsuario();

    var options = Options(
      method: 'POST',
      headers: {
        'Authorization': prefs.token,
      },
    );

    dio.options.contentType = 'application/json';

    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    try {
      final response = await dio.post(
          'http://192.168.150.65/core/api/v1/Estudiante/',
          data: data,
          options: options);

      if (response.statusCode == 201 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al crear los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _deleteEstudiante(
    int id,
  ) async {
    final prefs = PreferenciasDeUsuario();
    var options = Options(
      method: 'DELETE',
      headers: {
        'id': id.toString(),
        'Authorization': prefs.token,
      },
    );

    dio.options.contentType = 'application/json';

    dio.options.validateStatus = (status) {
      return status! < 500;
    };

    try {
      final response = await dio.delete(
          'http://192.168.150.65/core/api/v1/Estudiante/',
          options: options);

      if (response.statusCode == 200) {
        return 'Eliminado Con Exito';
      } else {
        return 'Error al Conectar con el Server:-${response.statusCode}';
      }
    } catch (e) {
      return 'Error al realizar la solicitud: $e';
    }
  }

  Future<String> _getJsonData(Map<String, dynamic> data) async {
    final prefs = PreferenciasDeUsuario();
    var options = Options(
      method: 'GET',
      headers: {
        'Authorization': prefs.token,
      },
    );

    dio.options.contentType = 'application/json';

    dio.options.validateStatus = (status) {
      return status! < 500;
    };

    try {
      final response = await dio.get(
          'http://192.168.150.65/core/api/v1/Estudiante/',
          options: options,
          data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _patchEstudiante(Map<String, dynamic> data) async {
    final prefs = PreferenciasDeUsuario();
    var options = Options(
      method: 'PATCH',
      headers: {
        'Authorization': prefs.token,
      },
    );

    dio.options.contentType = 'application/json';

    dio.options.validateStatus = (status) {
      return status! < 500;
    };
    try {
      final response = await dio.patch(
          'http://192.168.150.65/core/api/v1/Estudiante/',
          data: data,
          options: options);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
  getEstudiante(int id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    var data = {"id": id.toString()};
    final jsonData = await _getJsonData(data);
    final clientResponse = Estudiante.fromRawJson(jsonData);

    notifyListeners();
    return clientResponse;
  }

  deleteEstudiante(int id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final response = await _deleteEstudiante(id);
    if (response == 'Eliminado Con Exito') {
      //TODO:ACTUALIZAR CLIENTETRAMITE
      notifyListeners();
      return response;
    }
  }

  patchEstudiante(String indice, facultad, grupo) async {
    final data = {
      "idestudiante": prefs.userid,
      "indice": indice,
      "facultad": facultad,
      "grupo": grupo
    };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _patchEstudiante(data);

    final updateEstudianteJson = json.decode(responseBody);
    final updatedEstudiante = Estudiante.fromJson(updateEstudianteJson);
//TODO:ACTUALIZAR CLIENTETRAMITE

    notifyListeners();
  }

  postEstudiante(String indice, facultad, grupo) async {
    final data = {
      "idestudiante": prefs.userid,
      "indice": indice,
      "facultad": facultad,
      "grupo": grupo
    };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _postEstudiante(data);

    // Suponiendo que el servidor devuelve el vuelo actualizado en formato JSON
// final updateStudenJson = json.decode(responseBody);
    final updatedEstudiante = Estudiante.fromJson(responseBody);
//TODO:ACTUALIZAR CLIENTETRAMITE
  }

  @override
  notifyListeners(); // Notifica a los oyentes una vez después de realizar todos los cambios

  searchEstudiante(String query) async {
    final url = Uri.http(
      'http://192.168.150.65/core/api/v1/',
      '/Estudiante/search/$query',
    );
    final response = await http.get(url, headers: {'auth-token': prefs.token});

    final searchResponse = ListStudens.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String SearchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchEstudiante(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      debouncer.value = SearchTerm;
    });
    Future.delayed(const Duration(milliseconds: 1001))
        .then((_) => timer.cancel());
  }
}

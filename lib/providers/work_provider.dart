// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:app_tesis_yaliana/models/Trabajo.dart';
import 'package:app_tesis_yaliana/utils/preferencias_usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../helpers/debouncer.dart';

class WorkProvider extends ChangeNotifier {
  final Dio dio = Dio();
  final prefs = PreferenciasDeUsuario();



  List<Trabajo> works = [
  Trabajo(
    idtrabajo: 1,
    titulo: "Investigación sobre impacto del cambio climático",
    tutor: "Profesor Juan Pérez",
    cotutor: "Profesor Ana García",
    contenidoTrabajo: "Contenido del trabajo...",
    estadoRevision: "pending",
    categoria: "Ambiental",
    idcomision: 101,
    idevento: 202,
  ),
  
  Trabajo(
    idtrabajo: 2,
    titulo: "Análisis de algoritmos de optimización",
    tutor: "Profesor Carlos López",
    cotutor: "",
    contenidoTrabajo: "Contenido del trabajo...",
    estadoRevision: "completed",
    categoria: "Informática",
    idcomision: 102,
    idevento: 203,
  ),
  
  Trabajo(
    idtrabajo: 3,
    titulo: "Estudio sobre eficiencia energética en edificios",
    tutor: "Profesor María Rodríguez",
    cotutor: "Profesor José Martínez",
    contenidoTrabajo: "Contenido del trabajo...",
    estadoRevision: "in_progress",
    categoria: "Ambiental",
    idcomision: 103,
    idevento: 204,
    
  ),
  
  
];
  int page = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Trabajo>> _suggestionStreamController =
      StreamController.broadcast();
  final ip = '192.168.150.65';
  Stream<List<Trabajo>> get suggestionStream => _suggestionStreamController.stream;
  WorkProvider();

  Future<String> _postWork(Map<String, dynamic> data) async {
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
      final response = await dio.post('http://$ip/core/api/v1/Trabajo',
          data: data, options: options);

      if (response.statusCode == 200 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al crear los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _deleteWork(
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
      final response =
          await dio.delete('http://$ip/core/api/v1/Trabajo', options: options);

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
      final response = await dio.get('http://$ip/core/api/v1/Trabajo',
          options: options, data: data);

      if (response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _patchWork(Map<String, dynamic> data) async {
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
      final response = await dio.patch('http://$ip/core/api/v1/Trabajo',
          data: data, options: options);

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
  getWork(int id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    var data = {"id": id.toString()};
    final jsonData = await _getJsonData(data);
    final clientResponse = Trabajo.fromRawJson(jsonData);

    notifyListeners();
    return clientResponse;
  }

  deleteWork(int id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final response = await _deleteWork(id);
    if (response == 'Eliminado Con Exito') {
      //TODO:ACTUALIZAR CLIENTETRAMITE
      notifyListeners();
      return response;
    }
  }

  patchWork(
    String idComision,
  String idEvento,
    String plantilla,
String nombreTrabajo,
String edicion,
bool convocatoria,
String nivel,
bool esCopa,
DateTime fechaInicioTrabajo,
DateTime fechaFinTrabajo,
String curso,
String lugar,
String descripcionTrabajo,
) async {
  final data = {
    "titulo": nombreTrabajo,
    "tutor": "",
    "cotutor": "",
    "contenidoTrabajo": "",
    "estadoRevision": "",
    "categoria": "",
    "idcomision": idComision,
    "idevento": idEvento,
    "plantilla": plantilla,
    "edicion": edicion,
    "convocatoria": convocatoria,
    "nivel": nivel,
    "es_copa": esCopa,
    "fecha_inicio_trabajo": fechaInicioTrabajo.toIso8601String(),
    "fecha_fin_trabajo": fechaFinTrabajo.toIso8601String(),
    "curso": curso,
    "lugar": lugar,
    "descripcion_trabajo": descripcionTrabajo
  };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _patchWork(data);

    final updateWorkJson = json.decode(responseBody);
    final updatedWork = Trabajo.fromJson(updateWorkJson);
//TODO:ACTUALIZAR CLIENTETRAMITE

    notifyListeners();
  }

  postWork(
  String idComision,
  String idEvento,
String plantilla,
String nombreTrabajo,
String edicion,
bool convocatoria,
String nivel,
bool esCopa,
DateTime fechaInicioTrabajo,
DateTime fechaFinTrabajo,
String curso,
String lugar,
String descripcionTrabajo,
) async {
  final data = {
    "titulo": nombreTrabajo,
    "tutor": "",
    "cotutor": "",
    "contenidoTrabajo": "",
    "estadoRevision": "",
    "categoria": "",
    "idcomision": idComision,
    "idevento": idEvento,
    "plantilla": plantilla,
    "edicion": edicion,
    "convocatoria": convocatoria,
    "nivel": nivel,
    "es_copa": esCopa,
    "fecha_inicio_trabajo": fechaInicioTrabajo.toIso8601String(),
    "fecha_fin_trabajo": fechaFinTrabajo.toIso8601String(),
    "curso": curso,
    "lugar": lugar,
    "descripcion_trabajo": descripcionTrabajo
  };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _postWork(data);

    // Suponiendo que el servidor devuelve el vuelo actualizado en formato JSON
    final updateStudenJson = json.decode(responseBody);
    final updatedWork = Trabajo.fromJson(updateStudenJson);
//TODO:ACTUALIZAR CLIENTETRAMITE
  }

  @override
  notifyListeners(); // Notifica a los oyentes una vez después de realizar todos los cambios

  searchWork(String query) async {
    final url = Uri.http(
      'http://$ip/core/api/v1/',
      '/Trabajo/search/$query',
    );
    final response = await http.get(url, headers: {'auth-token': prefs.token});

    final searchResponse = ListWorks.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String SearchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchWork(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      debouncer.value = SearchTerm;
    });
    Future.delayed(const Duration(milliseconds: 1001))
        .then((_) => timer.cancel());
  }
}

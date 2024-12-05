// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:app_tesis_yaliana/models/Comision.dart';
import 'package:app_tesis_yaliana/utils/preferencias_usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../helpers/debouncer.dart';

class ComisionProvider extends ChangeNotifier {
  final Dio dio = Dio();
  final prefs = PreferenciasDeUsuario();

  List<Comision> comisions = [];
  int page = 0;

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Comision>> _suggestionStreamController =
      StreamController.broadcast();
  final ip = '192.168.91.116';
  Stream<List<Comision>> get suggestionStream =>
      _suggestionStreamController.stream;
  ComisionProvider(){
    getComisions();
  }

  Future<String> _postComision(Map<String, dynamic> data) async {
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
      final response = await dio.post('http://$ip/core/api/v1/Comision',
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

  Future<String> _deleteComision(
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
          await dio.delete('http://$ip/core/api/v1/Comision', options: options);

      if (response.statusCode == 200) {
        return 'Eliminado Con Exito';
      } else {
        return 'Error al Conectar con el Server:-${response.statusCode}';
      }
    } catch (e) {
      return 'Error al realizar la solicitud: $e';
    }
  }

  _getJsonData(String data) async {
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
      final response = await dio.get('http://$ip/core/api/v1/Comision/$data/',
          options: options,);

      if (response.statusCode == 200) {
        return response.data;
      }
      if (response.statusCode == 404) {
        return response.data;
      }  else {
        throw Exception('Error al obtener los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _patchComision(Map<String, dynamic> data) async {
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
      final response = await dio.patch('http://$ip/core/api/v1/Comision/$data/',
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
  Future<String> getComisions() async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
  
    final   jsonData = await _getJsonData(prefs.userid);
   
  if (jsonData['detail'] == 'No Comision matches the given query.') {
   comisions =[];
    return 'no';
  }
    final clientResponse = ListComisions.fromMap(jsonData);
    comisions = clientResponse.results;
    notifyListeners();
    return 'si';
  }
  Future<String> getComisionsByComisionId(String id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
  
    final   jsonData = await _getJsonData(id);
   
  if (jsonData['detail'] == 'No Comision matches the given query.') {
   comisions =[];
    return 'no';
  }
    final clientResponse = ListComisions.fromMap(jsonData);
    comisions = clientResponse.results;
    notifyListeners();
    return 'si';
  }

  deleteComision(int id) async {
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final response = await _deleteComision(id);
    if (response == 'Eliminado Con Exito') {
      //TODO:ACTUALIZAR CLIENTETRAMITE
      notifyListeners();
      return response;
    }
  }

  patchComision(
    String idComision,
    String idEvento,
    String plantilla,
    String nombreComision,
    String edicion,
    bool convocatoria,
    String nivel,
    bool esCopa,
    DateTime fechaInicioComision,
    DateTime fechaFinComision,
    String curso,
    String lugar,
    String descripcionComision,
  ) async {
    final data = {
      "titulo": nombreComision,
      "tutor": "",
      "cotutor": "",
      "contenidoComision": "",
      "estadoRevision": "",
      "categoria": "",
      "idcomision": idComision,
      "idevento": idEvento,
      "plantilla": plantilla,
      "edicion": edicion,
      "convocatoria": convocatoria,
      "nivel": nivel,
      "es_copa": esCopa,
      "fecha_inicio_comision": fechaInicioComision.toIso8601String(),
      "fecha_fin_comision": fechaFinComision.toIso8601String(),
      "curso": curso,
      "lugar": lugar,
      "descripcion_comision": descripcionComision
    };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _patchComision(data);

    final updateComisionJson = json.decode(responseBody);
    final updatedComision = Comision.fromJson(updateComisionJson);
  final updatedIndex = comisions.indexWhere((element) => element.id == updatedComision.id);
    
    // Si se encuentra el comision actualizado, actualizarlo en la lista
    if (updatedIndex != -1) {
      comisions[updatedIndex] = updatedComision;
      notifyListeners();
    }

    notifyListeners();
  }

  postComision(
    String idComision,
    String idEvento,
    String plantilla,
    String nombreComision,
    String edicion,
    bool convocatoria,
    String nivel,
    bool esCopa,
    DateTime fechaInicioComision,
    DateTime fechaFinComision,
    String curso,
    String lugar,
    String descripcionComision,
  ) async {
    final data = {
      "titulo": nombreComision,
      "tutor": "",
      "cotutor": "",
      "contenidoComision": "",
      "estadoRevision": "",
      "categoria": "",
      "idcomision": idComision,
      "idevento": idEvento,
      "plantilla": plantilla,
      "edicion": edicion,
      "convocatoria": convocatoria,
      "nivel": nivel,
      "es_copa": esCopa,
      "fecha_inicio_comision": fechaInicioComision.toIso8601String(),
      "fecha_fin_comision": fechaFinComision.toIso8601String(),
      "curso": curso,
      "lugar": lugar,
      "descripcion_comision": descripcionComision
    };
    //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
    final responseBody = await _postComision(data);

    // Suponiendo que el servidor devuelve el vuelo actualizado en formato JSON
    final updateStudenJson = json.decode(responseBody);
    final updatedComision = Comision.fromJson(updateStudenJson);
//TODO:ACTUALIZAR CLIENTETRAMITE
  }

  @override
  notifyListeners(); // Notifica a los oyentes una vez después de realizar todos los cambios

  searchComision(String query) async {
    final url = Uri.http(
      'http://$ip/core/api/v1/',
      '/Comision/search/$query',
    );
    final response = await http.get(url, headers: {'auth-token': prefs.token});

    final searchResponse = ListComisions.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String SearchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
      final results = await searchComision(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      debouncer.value = SearchTerm;
    });
    Future.delayed(const Duration(milliseconds: 1001))
        .then((_) => timer.cancel());
  }
}

// ignore_for_file: non_constant_identifier_names

import 'dart:async';
import 'dart:convert';

import 'package:app_tesis_yaliana/models/Event.dart';
import 'package:app_tesis_yaliana/utils/preferencias_usuario.dart';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;



import '../helpers/debouncer.dart';






class EventProvider extends ChangeNotifier {
 final Dio dio=Dio();
  final prefs = PreferenciasDeUsuario();
 
 final _baseURL='192.168.139.65/core/api/v1/';
 


  List<Event> eventos = [];
  int page=0;
  
 
  

  final debouncer = Debouncer(
    duration: const Duration(milliseconds: 500),
  );
  final StreamController<List<Event>> _suggestionStreamController =
      StreamController.broadcast();
    final ip= '192.168.150.65';
  Stream<List<Event>> get suggestionStream =>
      _suggestionStreamController.stream;
  EventProvider();

   
  Future<String> _postEvent(Map<String, dynamic> data) async {
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
          'http://$ip/core/api/v1/Evento',
          data: data,
          options: options);

      if (response.statusCode == 200 || response.statusCode == 200) {
        return response.data;
      } else {
        throw Exception('Error al crear los datos: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error al realizar la solicitud: $e');
    }
  }

  Future<String> _deleteEvent(
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
          'http://$ip/core/api/v1/Evento',
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

  Future<String> _getJsonData(Map<String, dynamic> data, {int page = 1}) async {
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
          'http://$ip/core/api/v1/Evento',
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

  Future<String> _patchEvent(
       Map<String, dynamic> data) async {
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
          'http://$ip/core/api/v1/Evento',
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
getEvent(int id)async{
  //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
var data ={
 "id":id.toString()
};
  final jsonData = await _getJsonData(data);
  final clientResponse = Event.fromRawJson(jsonData);
  
  notifyListeners();
  return clientResponse;
}
deleteEvent(int id)async{
  //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
  final response = await _deleteEvent(id);
  if (response == 'Eliminado Con Exito') {
      //TODO:ACTUALIZAR CLIENTETRAMITE
  notifyListeners();
  return response;
}

}
patchEvent( String plantilla,
    String nombreEvento,
    String edicion,
    bool convocatoria,
    String nivel,
    bool esCopa,
    DateTime fechaInicioEvento,
    DateTime fechaFinEvento,
    String curso,
    String lugar,
    String descripcionEvento,) async {
  
 final data = {
    "nombre_evento": nombreEvento,
    "edicion": edicion,
    "convocatoria": convocatoria,
    "nivel": nivel,
    "es_copa": esCopa,
    "fecha_inicio_evento": fechaInicioEvento,
    "fecha_fin_evento": fechaFinEvento,
    "curso": curso,
    "lugar": lugar,
    "descripcion_evento": descripcionEvento,
    "plantilla": plantilla
};
 //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
 final responseBody = await _patchEvent( data);

 
 final updateEventJson = json.decode(responseBody);
 final updatedEvent = Event.fromJson(updateEventJson);
//TODO:ACTUALIZAR CLIENTETRAMITE

 notifyListeners(); 
 }
postEvent(String plantilla,
    String nombreEvento,
    String edicion,
    bool convocatoria,
    String nivel,
    bool esCopa,
    DateTime fechaInicioEvento,
    DateTime fechaFinEvento,
    String curso,
    String lugar,
    String descripcionEvento,) async {
  
 final data = {
    "nombre_evento": nombreEvento,
    "edicion": edicion,
    "convocatoria": convocatoria,
    "nivel": nivel,
    "es_copa": esCopa,
    "fecha_inicio_evento": fechaInicioEvento,
    "fecha_fin_evento": fechaFinEvento,
    "curso": curso,
    "lugar": lugar,
    "descripcion_evento": descripcionEvento,
    "plantilla": plantilla
};
 //TODO:CAMBIAR POR EL URL CORRESPONDIENTE
 final responseBody = await _postEvent( data);

 // Suponiendo que el servidor devuelve el vuelo actualizado en formato JSON
 final updateStudenJson = json.decode(responseBody);
 final updatedEvent = Event.fromJson(updateStudenJson);
//TODO:ACTUALIZAR CLIENTETRAMITE
 }

 notifyListeners(); // Notifica a los oyentes una vez después de realizar todos los cambios


  

searchEvent(String query) async {
    final url = Uri.http(
      'http://$ip/core/api/v1/',
      '/Evento/search/$query',
    );
    final response = await http.get(url, headers: {'auth-token': prefs.token});

    final searchResponse = ListEvents.fromJson(response.body);
    return searchResponse.results;
  }

  void getSuggestionsByQuery(String SearchTerm) {
    debouncer.value = '';
    debouncer.onValue = (value) async {
  
      final results = await searchEvent(value);
      _suggestionStreamController.add(results);
    };
    final timer = Timer.periodic(const Duration(milliseconds: 1000), (_) {
      debouncer.value = SearchTerm;
    });
    Future.delayed(const Duration(milliseconds: 1001))
        .then((_) => timer.cancel());
  }
}

import 'dart:convert';
import 'package:app_tesis_yaliana/utils/preferencias_usuario.dart';
import 'package:flutter/foundation.dart';
import 'package:dio/dio.dart';

class UserProvider extends ChangeNotifier {
  final dio = Dio();
  final ip = '192.168.150.65';
  final PreferenciasDeUsuario prefs = PreferenciasDeUsuario();

  UserProvider();
  registerUser(String name, String password) async {
    final authData = {
      "username": name,
      "password": password,
    };
    try {
      final response = await dio.post(
          //TODO:URL PARA LOGIN
          'http://192.168.150.65/register',
          data: authData);
      var decodedResp = response.data;

      if (decodedResp.containsKey('token')) {
        prefs.token = decodedResp['token'].toString().split('|').last;
        return {'ok': true};
      } else {
        return {'ok': false, 'mensaje': decodedResp['message']};
      }
    } catch (e) {
      print('Error: ${e.toString()}');
      // Handle the error appropriately
    }
    dio.options.validateStatus = (status) {
      return status! < 500;
    };
  }

  Future<Map<String, dynamic>> loginUser(String user, String password) async {
    //TODO:Url final de release
    Map<String, String> authData = {
      "username": user,
      "password": password,
    };
    dio.options.validateStatus = (status) {
      return status! >= 200 && status < 500;
    };

    json.encode(authData);

    final response = await dio.post(
        //TODO:URL PARA LOGUIN
        'http://192.168.150.65/login',
        data: authData);
    final decodedResp = response.data;
    if (decodedResp.containsKey('token')) {
      prefs.token = decodedResp['token'];
      int userId = decodedResp['user']['id'];
      prefs.userid = userId.toString();
      prefs.rol = decodedResp['role'];
      return {'ok': true,
               'role':decodedResp['role'],
               'exist':decodedResp['exist'],         };
    }
    return {'ok': false, 'mensaje': decodedResp['message'],
    };
  }
}

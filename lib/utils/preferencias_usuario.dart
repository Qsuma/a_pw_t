
import 'package:shared_preferences/shared_preferences.dart';
class PreferenciasDeUsuario {
  static final PreferenciasDeUsuario _instancia = PreferenciasDeUsuario._internal();
  factory PreferenciasDeUsuario() {
    return _instancia;
  }
  PreferenciasDeUsuario._internal();
  late SharedPreferences _prefs;
  initPrefs() async {
    _prefs = await SharedPreferences.getInstance();
  }

  set modoOscuro(bool value) {
    _prefs.setBool('ModoOscuro', value);
  }

  bool get modoOscuro {
    return _prefs.getBool('ModoOscuro') ?? false;
  }
 String get token {
    return _prefs.getString('Token') ?? '';
  }

  set token(String value) {
    _prefs.setString('Token', value);
  }

  String get usuario {
    return _prefs.getString('usuario') ?? '';
  }

  set usuario(String value) {
    _prefs.setString('usuario', value);
  } 
 String get password {
    return _prefs.getString('password') ?? '';
  }

  set password(String value) {
    _prefs.setString('password', value);
  }
  
 set Rememberme(bool value) {
    _prefs.setBool('Rememberme', value);
  }

  bool get Rememberme {
    return _prefs.getBool('Rememberme') ?? false;
  }
    String get rol {
    return _prefs.getString('rol') ?? '';
  }

  set rol(String value) {
    _prefs.setString('rol', value);
  } 
      String get userid {
    return _prefs.getString('userid') ?? '';
  }

  set userid(String value) {
    _prefs.setString('userid', value);
  } 

}

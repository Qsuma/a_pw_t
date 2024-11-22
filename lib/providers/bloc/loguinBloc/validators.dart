import 'dart:async';


mixin Validators {
  final validarEmail =
      StreamTransformer<String, String>.fromHandlers(handleData: (email, sink) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(email)) {
      sink.add(email);
    } else {
      sink.addError('Email no es correcto');
    }
  });
   final validarEnteros =
      StreamTransformer<String, String>.fromHandlers(handleData: (grupo, sink) {
    Pattern pattern =
        r'^[1-9]\d{2}$';
    RegExp regExp = RegExp(pattern.toString());

    if (regExp.hasMatch(grupo)) {
      sink.add(grupo);
    } else {
      sink.addError('El grupo solo debe poseer caracteres de tres cifras');
    }
  });

  final validarDir = StreamTransformer<String, String>.fromHandlers(
    handleData: (data, sink) {
      if (data.isNotEmpty) {
        sink.add(data);
      } else {
        sink.addError('Debe poner la direccion');
      }
    },
  );

  final validarPassword = StreamTransformer<String, String>.fromHandlers(
      handleData: (password, sink) {
    Pattern pattern = '^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9]).{8}';
    RegExp regExp = RegExp(pattern.toString());
    if (regExp.hasMatch(password)) {
      sink.add(password);
    } else {
      sink.addError(
          'La contraseña debe contener al menos 8 caracteres, una mayuscula y un numero');
    }
  });

  StreamTransformer<String, String> validarConfirmarPassword(String password) =>
      StreamTransformer<String, String>.fromHandlers(handleData: (data, sink) {
        if (data == password) {
          sink.add(data);
        } else {
          sink.addError('Las contraseñas no coinciden');
        }
      });

  final validarTlf = StreamTransformer<String, String>.fromHandlers(
    handleData: (number, sink) {
      Pattern pattern = r'^\d+$';
      RegExp regExp = RegExp(pattern.toString());

      if (regExp.hasMatch(number)) {
        sink.add(number);
      } else {
        sink.addError('Debe contener solo numeros');
      }
    },
  );

  final validarNombre =
      StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(name) & name.isNotEmpty) {
      sink.add(name);
    } else {
      sink.addError('El nombre debe tener solo caracteres ');
    }
  });
  final validarUsuario =
    StreamTransformer<String, String>.fromHandlers(handleData: (name, sink) {
  Pattern pattern = r'^[a-zA-Z0-9]+$'; // Solo permite letras mayúsculas y minúsculas
  RegExp regExp = RegExp(pattern.toString());
  if (regExp.hasMatch(name) && name.isNotEmpty) {
    sink.add(name);
  } else {
    sink.addError('El nombre debe contener solo letras, sin espacios ni caracteres especiales');
  }
});

final validarFacultad =
      StreamTransformer<String, String>.fromHandlers(handleData: (facultadname, sink) {
    Pattern pattern = r'^[a-zA-Z0-9\s]+$';
    RegExp regExp = RegExp(pattern.toString());
    if (regExp.hasMatch(facultadname) & facultadname.isNotEmpty) {
      sink.add(facultadname);
    } else {
      sink.addError('La Facultad debe poseer solo caracteres ');
    }
  });

  final validarApellidos = StreamTransformer<String, String>.fromHandlers(
      handleData: (lastName, sink) {
    Pattern pattern = r'[!@#<>?":_`~;[\]\\|=+)(*&^%0-9-]';
    RegExp regExp = RegExp(pattern.toString());
    if (!regExp.hasMatch(lastName) & lastName.isNotEmpty) {
      sink.add(lastName);
    } else {
      sink.addError('Los apellidos solo deben contener caracteres');
    }
  });
  final validarIndice = StreamTransformer<String, String>.fromHandlers(
      handleData: (indice, sink) {
    Pattern pattern =  r'^(?:[2-4](?:\.\d{1,2})?|5(?:\.0{1,2})?)?$';
    RegExp regExp = RegExp(pattern.toString());
    if (regExp.hasMatch(indice) & indice.isNotEmpty) {
      sink.add(indice);
    } else {
      sink.addError('El indice debe de tener al menos dos lugares despues del punto y estar entre 2-5');
    }
  });
}

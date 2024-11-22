
import 'dart:convert';

class Profesor {
    final int idprofesor;
    final String asignatura;
    final String cargo;

    Profesor({
        required this.idprofesor,
        required this.asignatura,
        required this.cargo,
    });

    factory Profesor.fromRawJson(String str) => Profesor.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Profesor.fromJson(Map<String, dynamic> json) => Profesor(
        idprofesor: json["idprofesor"],
        asignatura: json["asignatura"],
        cargo: json["cargo"],
    );

    Map<String, dynamic> toJson() => {
        "idprofesor": idprofesor,
        "asignatura": asignatura,
        "cargo": cargo,
    };
}

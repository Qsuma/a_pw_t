import 'dart:convert';

class Equipo3 {
    final int idEquipo3;
    final String lugarAlcanzado;

    Equipo3({
        required this.idEquipo3,
        required this.lugarAlcanzado,
    });

    factory Equipo3.fromRawJson(String str) => Equipo3.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Equipo3.fromJson(Map<String, dynamic> json) => Equipo3(
        idEquipo3: json["idEquipo3"],
        lugarAlcanzado: json["lugar_alcanzado"],
    );

    Map<String, dynamic> toJson() => {
        "idEquipo3": idEquipo3,
        "lugar_alcanzado": lugarAlcanzado,
    };
}

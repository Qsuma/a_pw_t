import 'dart:convert';

class Plantilla {
    final String nombrePlantilla;
    final String contenido;
    final int idevento;

    Plantilla({
        required this.nombrePlantilla,
        required this.contenido,
        required this.idevento,
    });

    factory Plantilla.fromRawJson(String str) => Plantilla.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Plantilla.fromJson(Map<String, dynamic> json) => Plantilla(
        nombrePlantilla: json["nombre_plantilla"],
        contenido: json["contenido"],
        idevento: json["idevento"],
    );

    Map<String, dynamic> toJson() => {
        "nombre_plantilla": nombrePlantilla,
        "contenido": contenido,
        "idevento": idevento,
    };
}

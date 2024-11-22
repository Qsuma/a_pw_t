import 'dart:convert';

class Colateral {
    final String nombreColateral;
    final String descripcionColateral;
    final int idevento;

    Colateral({
        required this.nombreColateral,
        required this.descripcionColateral,
        required this.idevento,
    });

    factory Colateral.fromRawJson(String str) => Colateral.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Colateral.fromJson(Map<String, dynamic> json) => Colateral(
        nombreColateral: json["nombre_colateral"],
        descripcionColateral: json["descripcion_colateral"],
        idevento: json["idevento"],
    );

    Map<String, dynamic> toJson() => {
        "nombre_colateral": nombreColateral,
        "descripcion_colateral": descripcionColateral,
        "idevento": idevento,
    };
}

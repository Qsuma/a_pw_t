import 'dart:convert';

class Comision {
    final String tematica;
    final String jefe;

    Comision({
        required this.tematica,
        required this.jefe,
    });

    factory Comision.fromRawJson(String str) => Comision.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Comision.fromJson(Map<String, dynamic> json) => Comision(
        tematica: json["tematica"],
        jefe: json["jefe"],
    );

    Map<String, dynamic> toJson() => {
        "tematica": tematica,
        "jefe": jefe,
    };
}

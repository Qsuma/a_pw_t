import 'dart:convert';

class EventoEquipo3 {
    final int idevento;
    final int idequipo3;

    EventoEquipo3({
        required this.idevento,
        required this.idequipo3,
    });

    factory EventoEquipo3.fromRawJson(String str) => EventoEquipo3.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory EventoEquipo3.fromJson(Map<String, dynamic> json) => EventoEquipo3(
        idevento: json["idevento"],
        idequipo3: json["idequipo3"],
    );

    Map<String, dynamic> toJson() => {
        "idevento": idevento,
        "idequipo3": idequipo3,
    };
}

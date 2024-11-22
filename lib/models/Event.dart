import 'dart:convert';

class ListEvents {
  ListEvents({
    required this.results,
  });
  List<Event> results;

  factory ListEvents.fromJson(String str){
    if (str !="Error" &&  str!="{}") {
      return ListEvents.fromMap(json.decode(str));
    }
      else {
        const str2="{"
            "results: []"
            "}";
        return ListEvents.fromMap(json.decode(str2));
      }

  }



  factory ListEvents.fromMap(Map<String, dynamic> json){
    return  ListEvents(
        results: List<Event>.from(json["results"].map((x) => Event.fromRawJson(x))),
      );
  }

}
class Event {
    final int idevento;
    final String nombreEvento;
    final String edicion;
    final bool convocatoria;
    final String nivel;
    final bool esCopa;
    final DateTime fechaInicioEvento;
    final DateTime fechaFinEvento;
    final String curso;
    final String lugar;
    final String descripcionEvento;

    Event({
        required this.idevento,
        required this.nombreEvento,
        required this.edicion,
        required this.convocatoria,
        required this.nivel,
        required this.esCopa,
        required this.fechaInicioEvento,
        required this.fechaFinEvento,
        required this.curso,
        required this.lugar,
        required this.descripcionEvento,
    });

    factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Event.fromJson(Map<String, dynamic> json) => Event(
        idevento: json["idevento"],
        nombreEvento: json["nombre_evento"],
        edicion: json["edicion"],
        convocatoria: json["convocatoria"],
        nivel: json["nivel"],
        esCopa: json["es_copa"],
        fechaInicioEvento: json["fecha_inicio_evento"],
        fechaFinEvento: json["fecha_fin_evento"],
        curso: json["curso"],
        lugar: json["lugar"],
        descripcionEvento: json["descripcion_evento"],
    );

    Map<String, dynamic> toJson() => {
        "idevento": idevento,
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
    };
}

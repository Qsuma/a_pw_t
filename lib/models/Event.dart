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



  factory ListEvents.fromMap(List< dynamic> json){
    return  ListEvents(
        results: List<Event>.from(json.map((x) => Event.fromJson(x))),
      );
  }

}
class Event {
  final int idevento;
  final String nombreEvento;
  final String edicion;
  final bool? convocatoria;  // Cambiado a tipo nullable para manejar valores nulos
  final String nivel;
  final bool esCopa;
  final DateTime? fechaInicioEvento;  // Nullable para manejar el valor null
  final DateTime? fechaFinEvento;  // Nullable para manejar el valor null
  final String curso;
  final String lugar;
  final String? descripcionEvento;  // Nullable para manejar el valor null
  final String? plantilla;  // Nullable para manejar el valor null

  Event({
    required this.idevento,
    required this.nombreEvento,
    required this.edicion,
    this.convocatoria,
    required this.nivel,
    required this.esCopa,
    this.fechaInicioEvento,
    this.fechaFinEvento,
    required this.curso,
    required this.lugar,
    this.descripcionEvento,
    this.plantilla,
  });

  factory Event.fromRawJson(String str) => Event.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Event.fromJson(Map<String, dynamic> json) => Event(
    idevento: json["idevento"],
    nombreEvento: json["nombre_evento"],
    edicion: json["edicion"],
    convocatoria: json["convocatoria"],  // El valor puede ser null
    nivel: json["nivel"],
    esCopa: json["es_copa"],
    fechaInicioEvento: json["fecha_inicio_evento"] != null ? DateTime.parse(json["fecha_inicio_evento"]) : null, // Manejo de nulos
    fechaFinEvento: json["fecha_fin_evento"] != null ? DateTime.parse(json["fecha_fin_evento"]) : null, // Manejo de nulos
    curso: json["curso"],
    lugar: json["lugar"],
    descripcionEvento: json["descripcion_evento"], // El valor puede ser null
    plantilla: json["plantilla"], // El valor puede ser null
  );

  Map<String, dynamic> toJson() => {
    "idevento": idevento,
    "nombre_evento": nombreEvento,
    "edicion": edicion,
    "convocatoria": convocatoria,
    "nivel": nivel,
    "es_copa": esCopa,
    "fecha_inicio_evento": fechaInicioEvento?.toIso8601String(),  // Se maneja el valor null
    "fecha_fin_evento": fechaFinEvento?.toIso8601String(),  // Se maneja el valor null
    "curso": curso,
    "lugar": lugar,
    "descripcion_evento": descripcionEvento,
    "plantilla": plantilla,
  };
}

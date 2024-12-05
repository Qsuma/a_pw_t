import 'dart:convert';

class ListWorks {
  ListWorks({
    required this.results,
  });
  List<Trabajo> results;

  factory ListWorks.fromJson(String str){
    if (str !="Error" &&  str!="{}") {
      return ListWorks.fromMap(json.decode(str));
    }
      else {
        const str2="{"
            "results: []"
            "}";
        return ListWorks.fromMap(json.decode(str2));
      }

  }



  factory ListWorks.fromMap(List<dynamic> json){
    return  ListWorks(
        results: List<Trabajo>.from(json.map((x) => Trabajo.fromRawJson(x))),
      );
  }

}
class Trabajo {
    final int idtrabajo;
    final String titulo;
    final String tutor;
    final String cotutor;
    final String contenidoTrabajo;
    late final String estadoRevision;
    final String categoria;
    final int idcomision;
    final int idevento;

    Trabajo({
        required this.idtrabajo,
        required this.titulo,
        required this.tutor,
        required this.cotutor,
        required this.contenidoTrabajo,
        required this.estadoRevision,
        required this.categoria,
        required this.idcomision,
        required this.idevento,
    });

    factory Trabajo.fromRawJson(String str) => Trabajo.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Trabajo.fromJson(Map<String, dynamic> json) => Trabajo(
        idtrabajo: json["idtrabajo"],
        titulo: json["titulo"],
        tutor: json["tutor"],
        cotutor: json["cotutor"],
        contenidoTrabajo: json["contenido_trabajo"],
        estadoRevision: json["estado_revision"],
        categoria: json["categoria"],
        idcomision: json["idcomision"],
        idevento: json["idevento"],
    );

    Map<String, dynamic> toJson() => {
        "idtrabajo": idtrabajo,
        "titulo": titulo,
        "tutor": tutor,
        "cotutor": cotutor,
        "contenido_trabajo": contenidoTrabajo,
        "estado_revision": estadoRevision,
        "categoria": categoria,
        "idcomision": idcomision,
        "idevento": idevento,
    };
}

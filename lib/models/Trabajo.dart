import 'dart:convert';

class Trabajo {
    final int idtrabajo;
    final String titulo;
    final String tutor;
    final String cotutor;
    final String contenidoTrabajo;
    final String estadoRevision;
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

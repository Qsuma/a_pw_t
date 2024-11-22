import 'dart:convert';

class ListStudens {
  ListStudens({
    required this.results,
  });
  List<Estudiante> results;

  factory ListStudens.fromJson(String str){
    if (str !="Error" &&  str!="{}") {
      return ListStudens.fromMap(json.decode(str));
    }
      else {
        const str2="{"
            "results: []"
            "}";
        return ListStudens.fromMap(json.decode(str2));
      }

  }



  factory ListStudens.fromMap(Map<String, dynamic> json){
    return  ListStudens(
        results: List<Estudiante>.from(json["results"].map((x) => Estudiante.fromRawJson(x))),
      );
  }

}
class Estudiante {
    final int idestudiante;
    final double indice;
    final String facultad;
    final String grupo;

    Estudiante({
        required this.idestudiante,
        required this.indice,
        required this.facultad,
        required this.grupo,
    });

    factory Estudiante.fromRawJson(String str) => Estudiante.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Estudiante.fromJson(Map<String, dynamic> json) => Estudiante(
        idestudiante: json["idestudiante"],
        indice: json["indice"],
        facultad: json["facultad"],
        grupo: json["grupo"],
    );

    Map<String, dynamic> toJson() => {
        "idestudiante": idestudiante,
        "indice": indice,
        "facultad": facultad,
        "grupo": grupo,
    };
}

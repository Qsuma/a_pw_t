import 'dart:convert';

class ListComisions {
  ListComisions({
    required this.results,
  });
  List<Comision> results;
  
  factory ListComisions.fromJson(String str){
    if (str !="Error" &&  str!="{}") {
      return ListComisions.fromMap(json.decode(str));
    }
      else {
        const str2="{"
            "results: []"
            "}";
        return ListComisions.fromMap(json.decode(str2));
      }

  }



  factory ListComisions.fromMap(List< dynamic> json){
    return  ListComisions(
        results: List<Comision>.from(json.map((x) => Comision.fromJson(x))),
      );
  }

}
class Comision {
  final int id;
  final String tematica;
  final String jefe;

  Comision({
    required this.id,
    required this.tematica,
    required this.jefe,
  });

  factory Comision.fromRawJson(String str) =>
      Comision.fromJson(json.decode(str));

 

  factory Comision.fromJson(Map<String, dynamic> json) => Comision(
        id: json["id"],
        tematica: json["tematica"],
        jefe: json["jefe"],
      );

  
}

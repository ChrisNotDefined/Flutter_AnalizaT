import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
ResultModel resultModelFromJson(String str) =>
    ResultModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ColesterolModel {
  ColesterolModel({this.hdl = 0.0, this.ldl = 0.0});

  double hdl;
  double ldl;
}

class ResultModel {
  ResultModel(
      {this.id = '',
      this.idUsuario = '',
      this.trigliceridos = 0.0,
      this.globulosRojos = 0.0,
      this.globulosBlancos = 0.0,
      this.hemoglobina = 0.0,
      this.plaquetas = 0.0,
      this.glucosa = 0.0,
      this.acidoUrico = 0.0,
      this.colesterol});

  String id;
  String idUsuario;
  double trigliceridos;
  double globulosRojos;
  double globulosBlancos;
  double hemoglobina;
  double plaquetas;
  double glucosa;
  double acidoUrico;
  ColesterolModel colesterol;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
      id: json["_id"],
      idUsuario: json["id_usuario"],
      trigliceridos: json["Trigliceridos"],
      globulosRojos: json["GlobulosRojos"],
      globulosBlancos: json["GlobulosBlancos"],
      hemoglobina: json["Hemoglobina"],
      plaquetas: json["Plaquetas"],
      glucosa: json["Glucosa"],
      colesterol: json["Colesterol"]);

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "Trigliceridos": trigliceridos,
        "GlobulosRojos": globulosRojos,
        "GlobulosBlancos": globulosBlancos,
        "Hemoglobina": hemoglobina,
        "Plaquetas": plaquetas,
        "Glucosa": glucosa,
        "Colesterol": colesterol,
      };
}

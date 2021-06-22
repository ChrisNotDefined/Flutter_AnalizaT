// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

ResultModel resultModelFromJson(String str) =>
    ResultModel.fromJson(json.decode(str));

String resultModelToJson(ResultModel data) => json.encode(data.toJson());

class ResultModel {
  ResultModel({
    this.id,
    this.idUsuario,
    this.trigliceridos,
    this.globulosRojos,
    this.globulosBlancos,
    this.hemoglobina,
    this.plaquetas,
    this.glucosa,
    this.acidoUrico,
    this.colesterol,
  });

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

  factory ResultModel.fromJson(Map<String, dynamic> json) => ResultModel(
        id: json["_id"],
        idUsuario: json["id_usuario"],
        trigliceridos: json["Trigliceridos"].toDouble(),
        globulosRojos: json["GlobulosRojos"].toDouble(),
        globulosBlancos: json["GlobulosBlancos"].toDouble(),
        hemoglobina: json["Hemoglobina"].toDouble(),
        plaquetas: json["Plaquetas"].toDouble(),
        glucosa: json["Glucosa"].toDouble(),
        acidoUrico: json["AcidoUrico"].toDouble(),
        colesterol: ColesterolModel.fromJson(json["Colesterol"]),
      );

  Map<String, dynamic> toJson() => {
        "id_usuario": idUsuario,
        "Trigliceridos": trigliceridos,
        "GlobulosRojos": globulosRojos,
        "GlobulosBlancos": globulosBlancos,
        "Hemoglobina": hemoglobina,
        "Plaquetas": plaquetas,
        "Glucosa": glucosa,
        "AcidoUrico": acidoUrico,
        "Colesterol": colesterol.toJson(),
      };
}

class ColesterolModel {
  ColesterolModel({
    this.hdl,
    this.ldl,
  });

  double hdl;
  double ldl;

  factory ColesterolModel.fromJson(Map<String, dynamic> json) =>
      ColesterolModel(
        hdl: json["HDL"].toDouble(),
        ldl: json["LDL"].toDouble(),
      );

  Map<String, dynamic> toJson() => {
        "HDL": hdl,
        "LDL": ldl,
      };
}

import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
RegisterModel registerModelFromJson(String str) =>
    RegisterModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String registerModelToJson(RegisterModel data) => json.encode(data.toJson());

class RegisterModel {
  RegisterModel({
    this.id,
    this.peso = 0.0,
    this.estatura = 0.0,
    this.cintura = 0.0,
    this.pecho = 0.0,
  });

  String id;
  double peso;
  double estatura;
  double cintura;
  double pecho;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory RegisterModel.fromJson(Map<String, dynamic> json) => RegisterModel(
        id: json["_id"],
        peso: json["peso"],
        estatura: json["estatura"],
        cintura: json["cintura"],
        pecho: json["pecho"],
      );

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "peso": peso,
        "estatura": estatura,
        "cintura": cintura,
        "pecho": pecho,
      };
}

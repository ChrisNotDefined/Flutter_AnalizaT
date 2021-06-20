import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id,
    this.nombre = '',
    this.correo = '',
    this.sexo = '',
    this.fecha_nacimiento = '',
    this.registros,
  });

  String id;
  String nombre;
  String correo;
  String sexo;
  String fecha_nacimiento;
  List<String> registros;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
      id: json["_id"],
      nombre: json["nombre"],
      correo: json["correo"],
      sexo: json["sexo"],
      fecha_nacimiento: json["fecha_nacimiento"],
      registros: json["registros"]);

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "_id": id,
        "nombre": nombre,
        "correo": correo,
        "sexo": sexo,
        "fecha_nacimiento": fecha_nacimiento,
        "registros": registros
      };
}

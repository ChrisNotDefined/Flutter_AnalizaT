import 'dart:convert';

// Recibe json en forma de string y regresa nueva instancia del modelo
UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

// toma el modelo y lo modela como json
String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  UserModel({
    this.id = '',
    this.nombre = '',
    this.correo = '',
    this.sexo = '',
    this.fechaNacimiento = '',
    this.registros,
  });

  String id;
  String nombre;
  String correo;
  String sexo;
  String fechaNacimiento;
  List<String> registros;

  // Recibe mapa y regresa nueva intancia por eso factory
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["_id"],
        nombre: json["nombre"],
        correo: json["correo"],
        sexo: json["sexo"],
        fechaNacimiento: json["fecha_nacimiento"],
        registros: List<String>.from(json["registros"]),
      );

  // toma el modelo y lo transforma a json
  Map<String, dynamic> toJson() => {
        "nombre": nombre,
        "correo": correo,
        "sexo": sexo,
        "fecha_nacimiento": fechaNacimiento,
        "registros": registros,
      };
}

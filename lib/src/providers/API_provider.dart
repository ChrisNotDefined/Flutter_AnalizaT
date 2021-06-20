import 'dart:convert';
import '../models/user_model.dart';
import '../models/result_model.dart';
import '../models/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:core';
import 'package:mime_type/mime_type.dart';
import 'package:http_parser/http_parser.dart';
import 'dart:io';

final String _url = "https://limitless-bayou-74846.herokuapp.com";

class UserProvider {
  Future<List<UserModel>> getUsers() async {
    final url = Uri.https(_url, '/users');
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<UserModel> users = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, us) {
      final user = UserModel.fromJson(us);
      users.add(user);
    });

    print(users);
    return users;
  }

  Future<List<UserModel>> getUserById(String userId) async {
    final url = Uri.https(
      _url,
      "/users/$userId",
    );
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<UserModel> users = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, us) {
      final user = UserModel.fromJson(us);
      users.add(user);
    });

    print(users);
    return users;
  }

  Future<bool> postUser(UserModel user) async {
    final url = Uri.https(_url, '/users/${user.id}');

    final resp = await http.post(url, body: userModelToJson(user));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<bool> putUser(UserModel user) async {
    final url = Uri.https(_url, '/users/${user.id}');

    final resp = await http.put(url, body: userModelToJson(user));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<int> deleteUser(String userId) async {
    final url = Uri.https(_url, '/users/$userId');
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }
}

class ResultProvider {
  Future<List<ResultModel>> getResults() async {
    final url = Uri.https(_url, '/results');
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<ResultModel> results = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, res) {
      final result = ResultModel.fromJson(res);
      results.add(result);
    });

    print(results);
    return results;
  }

  Future<List<ResultModel>> getResultByUserId(String userId) async {
    final url = Uri.https(
      _url,
      "/results/$userId",
    );
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<ResultModel> results = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, res) {
      final result = ResultModel.fromJson(res);
      results.add(result);
    });

    print(results);
    return results;
  }

  Future<bool> postResult(ResultModel result) async {
    final url = Uri.https(_url, '/results/${result.id_usuario}');

    final resp = await http.post(url, body: resultModelToJson(result));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<bool> putResult(ResultModel result) async {
    final url = Uri.https(_url, '/results/${result.id_usuario}');

    final resp = await http.put(url, body: resultModelToJson(result));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<int> deleteResult(String resultId) async {
    final url = Uri.https(_url, '/results/$resultId');
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }
}

class RegisterProvider {
  Future<List<RegisterModel>> getRegisterById(String registerId) async {
    final url = Uri.https(_url, '/register/$registerId');
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<RegisterModel> registers = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, reg) {
      final register = RegisterModel.fromJson(reg);
      registers.add(register);
    });

    print(registers);
    return registers;
  }

  Future<List<RegisterModel>> getRegistersByUserId(String userId) async {
    final url = Uri.https(_url, '/registers/$userId');
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<RegisterModel> registers = new List();

    if (decodeData == null) return [];

    decodeData.forEach((id, reg) {
      final register = RegisterModel.fromJson(reg);
      registers.add(register);
    });

    print(registers);
    return registers;
  }

  Future<bool> postRegister(RegisterModel register, String userId) async {
    final url = Uri.https(_url, '/results/$userId');

    final resp = await http.post(url, body: registerModelToJson(register));

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<int> deleteRegister(String userId) async {
    final url = Uri.https(_url, '/registers/$userId');
    final resp = await http.delete(url);

    print(json.decode(resp.body));

    return 1;
  }
}

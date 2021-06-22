import 'dart:convert';
import '../models/user_model.dart';
import '../models/result_model.dart';
import '../models/register_model.dart';
import 'package:http/http.dart' as http;
import 'dart:core';

final String _url = "limitless-bayou-74846.herokuapp.com";

class UserProvider {
  Future<List<UserModel>> getUsers() async {
    final url = Uri.https(_url, '/users');
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    final List<UserModel> users = [];

    if (decodeData == null) return [];

    decodeData.forEach((id, us) {
      final user = UserModel.fromJson(us);
      users.add(user);
    });

    print(users);
    return users;
  }

  Future<UserModel> getUserById(String userId) async {
    print('Called api');
    final url = Uri.https(
      _url,
      "/users/$userId",
    );

    try {
      final resp = await http.get(url);

      if (resp.statusCode != 200) {
        print('Server respondend ${resp.statusCode}');
        return null;
      }

      final Map<String, dynamic> decodeData = json.decode(resp.body);
      UserModel user;

      if (decodeData == null) return null;

      user = UserModel.fromJson(decodeData);
      return user;
    } catch (e) {
      print('========ERROR getUserById==========');
      print(e);

      return null;
    }
  }

  Future<bool> postUser(UserModel user) async {
    final url = Uri.https(_url, '/users/${user.id}');

    try {
      final body = userModelToJson(user);
      print('Body: $body');
      final resp = await http.post(
        url,
        body: userModelToJson(user),
        headers: {'content-type': 'application/json'},
      );

      if (resp.statusCode < 200 || resp.statusCode >= 300) {
        print('Server returned ${resp.statusCode}');
        return false;
      }

      final decodeData = json.decode(resp.body);

      print(decodeData);

      return true;
    } catch (e) {
      print('ERROR POSTING');
      print(e);
      return false;
    }
  }

  Future<bool> putUser(UserModel user) async {
    final url = Uri.https(_url, '/users/${user.id}');

    try {
      final resp = await http.put(
        url,
        body: userModelToJson(user),
        headers: {'content-type': 'application/json'},
      );

      final decodeData = json.decode(resp.body);

      print(decodeData);

      return true;
    } catch (e) {
      print('ERROR PUTTING');
      print(e);
      return false;
    }
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
    final List<ResultModel> results = [];

    if (decodeData == null) return [];

    decodeData.forEach((id, res) {
      final result = ResultModel.fromJson(res);
      results.add(result);
    });

    print(results);
    return results;
  }

  Future<ResultModel> getResultByUserId(String userId) async {
    final url = Uri.https(
      _url,
      "/results/$userId",
    );
    final resp = await http.get(url);

    final Map<String, dynamic> decodeData = json.decode(resp.body);
    ResultModel result;

    if (decodeData == null) return null;

    result = ResultModel.fromJson(decodeData);

    print(result);
    return result;
  }

  Future<bool> postResult(ResultModel result) async {
    final url = Uri.https(_url, '/results/${result.idUsuario}');

    final resp = await http.post(
      url,
      body: resultModelToJson(result),
      headers: {'content-type': 'application/json'},
    );

    final decodeData = json.decode(resp.body);

    print(decodeData);

    return true;
  }

  Future<bool> putResult(ResultModel result) async {
    final url = Uri.https(_url, '/results/${result.idUsuario}');

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
    final List<RegisterModel> registers = [];

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

    final List<dynamic> decodeData = json.decode(resp.body);

    final List<RegisterModel> registers = [];
    if (decodeData == null) return [];

    decodeData.forEach((reg) {
      final register = RegisterModel.fromJson(reg);
      registers.add(register);
    });

    return registers;
  }

  Future<bool> postRegister(RegisterModel register, String userId) async {
    final url = Uri.https(_url, '/results/$userId');

    final resp = await http.post(
      url,
      body: registerModelToJson(register),
      headers: {'content-type': 'application/json'},
    );

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

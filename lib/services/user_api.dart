import 'dart:convert';

import 'package:learning_flutterapi/models/user_dob.dart';

import '../models/user_model.dart';
import '../models/usernam_model.dart';
import 'package:http/http.dart' as http;

class UserAPI {
  static Future<List<UserModel>> fetchUser() async {
    const url = 'https://randomuser.me/api/?results=50';
    final uri = Uri.parse(url);
    final response = await http.get(uri);
    final body = response.body;
    final json = jsonDecode(body);

    final results = json['results'] as List<dynamic>;
    dynamic users = results.map((e) {
      final name = UserName(
        title: e["user"]['title'],
        first: e['user']["first"],
        last: e["last"],
      );
      final dateTime=e['dob']['dateTime'];
      final dob = UserDOB(
        age: e['dob']['age'],
        dateTime: DateTime.parse(dateTime),

      );
      return UserModel(
        email: e['email'],
        cell: e['cell'],
        phone: e['phone'],
        nat: e['nat'],
        name: name,
        dob: dob,
        gender: e['gender'],
      );
    }).toList();
    return users;
  }
}

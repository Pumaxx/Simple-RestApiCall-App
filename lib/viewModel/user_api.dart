import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'package:rest/model/user.dart';
import 'package:rest/model/user_name.dart';
import 'package:rest/model/user_picture.dart';

class UserApi {
  static Future<List<User>> fetchUsers() async {
    const String url = 'https://randomuser.me/api/?results=30';
    final Uri uri = Uri.parse(url);
    final Response response = await http.get(uri);
    final String body = response.body;
    final json = jsonDecode(body);
    final results = json['results'] as List<dynamic>;
    final resultsToUsers = results.map((person) {
      final userName = UserName(
        title: person['name']['title'],
        first: person['name']['first'],
        last: person['name']['last'],
      );

      final userPicture = UserPicture(
        large: person['picture']['large'],
        medium: person['picture']['medium'],
        thumbnail: person['picture']['thumbnail'],
      );

      return User(
        gender: person['gender'],
        email: person['email'],
        phone: person['phone'],
        cell: person['cell'],
        nat: person['nat'],
        picture: userPicture,
        name: userName,
      );
    }).toList();

    return resultsToUsers;
  }
}

import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';

class User {
  int id;
  String name;

  User({
    required this.id,
    required this.name,
  });

  factory User.createUser(
    dynamic object,
  ) {
    return User(
      id: object['id'],
      name: object['first_name'] + ' ' + object['last_name'],
    );
  }

  /// Use Dio
  // static Future<List<User>> getUsers(String page) async {
  //   String apiURL = 'https://reqres.in/api/users?page=' + page;

  //   var apiResult = await Dio().get(apiURL);

  //   var jsonObject = apiResult.data;

  //   List<dynamic> listUser =( jsonObject as Map<String, dynamic>)['data'];

  //   List<User> users = [];
  //   for (int i = 0; i < users.length; i++) {
  //     users.add(User.createUser(listUser[i]));
  //   }

  //   return users;
  // }

  // static Future<List<User>> fetchUser(String page) async {
  //   // final response = await http.get(
  //   //   Uri.http(
  //   //     'https://reqres.in/api',
  //   //     '/users',
  //   //     {'?page=': '$start'},
  //   //   ),
  //   // );

  //   final response = await Dio().get(
  //     'https://reqres.in/api/users?page=$page',
  //   );

  //   if (response.statusCode != 200) {
  //     throw Exception('Failed to load User');
  //   }

  //   final json = response.data['data'];
  //   return json.map<User>((users) => users(json)).toList();
  // }

  static Future<List<User>> getUsers(String page) async {
    String apiURL = 'https://reqres.in/api/users?page=' + page;

    var apiResult = await http.get(Uri.parse(apiURL));

    if (apiResult.statusCode != 200) {
      throw Exception('Failed to Load User');
    }

    // final json = jsonDecode(apiResult.body)['data'] as List;
    // return json.map<User>((users) => User.createUser(json)).toList();
    var jsonObject = json.decode(apiResult.body);
    List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

    List<User> users = [];
    for (int i = 0; i < listUser.length; i++) {
      users.add(User.createUser(listUser[i]));
    }

    return users;
  }
}


  /// Use http
  // static Future<List<User>> getUsers(String page) async {
  //   String apiURL = 'https://reqres.in/api/users?page=' + page;

  //   var apiResult = await http.get(Uri.parse(apiURL));
  //   var jsonObject = json.decode(apiResult.body);

  //   List<dynamic> listUser = (jsonObject as Map<String, dynamic>)['data'];

  //   List<User> users = [];
  //   for (int i = 0; i < listUser.length; i++) {
  //     users.add(User.createUser(listUser[i]));
  //   }

  //   return users;
  // }

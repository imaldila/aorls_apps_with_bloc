import 'dart:convert';

import 'package:dio/dio.dart';

import '../models/post.dart';

abstract class ServicesList {
  static Future<List<Post?>> getById(int pages) async {
    try {
      var responses =
          await Dio().get('https://reqres.in/api/users?page=$pages');

      var jsonObject = jsonDecode(responses.data) as List;

      return jsonObject
          .map<Post>(
            (item) => Post(
              id: item['id'],
              email: item['email'],
              name: item['first_name'],
            ),
          )
          .toList();
      // if (responses.statusCode == 200) {
      //   return responses.data['data']
      //       .map<Post?>((item) => Post(
      //             id: item['id'],
      //             email: item['email'],
      //             name: item['first_name'] + ' ' + item['last_name'],
      //           ))
      //       .toList();
      // }
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

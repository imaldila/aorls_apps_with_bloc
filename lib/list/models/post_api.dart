import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:dio/dio.dart';
import 'package:aorl_apps_bloc/list/models/post.dart';

class PostAPI {
  static Future<List<Post>> fetchPost(String page) async {
    // final response = await http.get(
    //   Uri.http(
    //     'https://reqres.in/api',
    //     '/users',
    //     {'?page=': '$start'},
    //   ),
    // );

    final response = await Dio().get(
      'https://reqres.in/api/users?page=$page',
    );

    if (response.statusCode != 200) {
      throw Exception('Failed to load post');
    }

    final json = jsonDecode(response.data)['data'] as List;
    return json.map<Post>((post) => Post.fromJson(json)).toList();
  }
}

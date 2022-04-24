import 'dart:convert';

import 'package:dio/dio.dart';

class Post {
  String email, name;
  int id;
  Post({
    required this.id,
    required this.email,
    required this.name,
  });
  factory Post.createPost(Map<String, dynamic> object) {
    return Post(
      id: object['data']['id'],
      email: object['data']['email'],
      name: object['data']['first_name'],
    );
  }

  static Future<List<Post>> connectToAPI(int page) async {
    String apiURL = 'https://reqres.in/api/users?page=2';
    var apiResult = await Dio().get(apiURL);
    print(apiResult.statusCode);
    var jsonObject = jsonDecode(apiResult.data) as List;
    return jsonObject
        .map<Post>(
          (item) => Post(
            id: item['data']['id'],
            email: item['data']['email'],
            name: item['data']['first_name'],
          ),
        )
        .toList();
  }
}

import 'package:aorl_apps_bloc/dio/models/person.dart';
import 'package:dio/dio.dart';

abstract class Services {
  static Future<Person?> getById(int id) async {
    try {
      var response = await Dio().get('https://reqres.in/api/users/$id');
      // var response = await Dio().get('https://reqres.in/api/users?page=$id');

      if (response.statusCode == 200) {
        return Person(
          id: response.data['data']['id'],
          name: response.data['data']['first_name'] +
              ' ' +
              response.data['data']['last_name'],
          email: response.data['data']['email'],
        );
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  static Future<Person?> createUser(String firstName, lastName, email) async {
    try {
      var response = await Dio().post('https://reqres.in/api/users', data: {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      });

      if (response.statusCode == 201) {
        return Person(
          id: int.tryParse(response.data['id'].toString()) ?? 0,
          name: response.data['first_name'] + ' ' + response.data['last_name'],
          email: response.data['email'],
        );
      }
      return null;
    } catch (e) {
      throw Exception(e.toString());
    }
  }
}

import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.email,
    required this.name,
  });

  final int id;
  final String email, name;

  factory Post.fromJson(
    dynamic json,
  ) {
    return Post(
      id: json['id'],
      email: json['email'],
      name: json['first_name'] + ' ' + json['last_name'],
    );
  }

  @override
  List<Object?> get props => [id, email, name];
}

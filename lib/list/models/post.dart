import 'package:equatable/equatable.dart';

class Post extends Equatable {
  const Post({
    required this.id,
    required this.email,
    required this.name,
    required this.avatar
  });

  final int id;
  final String email, name, avatar;

  factory Post.fromJson(
    dynamic json,
  ) {
    return Post(
      id: json['id'],
      email: json['email'],
      name: json['first_name'] + ' ' + json['last_name'],
      avatar: json['avatar'],
    );
  }

  @override
  List<Object?> get props => [id, email, name];
}

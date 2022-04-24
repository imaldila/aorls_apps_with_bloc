part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();

  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostUnInitialized extends PostState {}

class PostLoaded extends PostState {
  List<Post> posts;
  bool hasReachedMax;

  PostLoaded({required this.posts, required this.hasReachedMax});

  PostLoaded copyWith({List<Post>? posts, hasReachedMax}) {
    return PostLoaded(
      posts: posts ?? this.posts,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}

part of 'post_bloc.dart';

abstract class PostState extends Equatable {
  const PostState();
  
  @override
  List<Object> get props => [];
}

class PostInitial extends PostState {}

class PostError extends PostState {}

class PostLoaded extends PostState {
PostLoaded({
   this.posts = const <Post>[],
   this.hasReachedMax = false,
});

final List<Post> posts;
final bool hasReachedMax;


PostLoaded copyWith({List<Post>? posts, bool? hasReachedMax}) {
  return PostLoaded(
    posts: posts ?? this.posts,
    hasReachedMax: hasReachedMax ?? this.hasReachedMax,
  );
}
  @override
  List<Object> get props => [posts, hasReachedMax];
}
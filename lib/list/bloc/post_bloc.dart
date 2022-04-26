import 'package:aorl_apps_bloc/list/models/post_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    // ignore: void_checks
    on<PostEvent>((event, emit) async* {
      if (event is PostLoaded) {
        yield await _mapPostToState(state);
      }
    });
  }

  Future<PostState> _mapPostToState(PostState state) async {
    List<Post> posts;

    try {
      if (state is PostInitial) {
        posts = await PostAPI.fetchPost('2');
        return PostLoaded(posts: posts);
      }

      PostLoaded postLoaded = state as PostLoaded;
      posts = await PostAPI.fetchPost('2');
      return posts.isEmpty
          ? state.copyWith(hasReachedMax: true)
          : state.copyWith(posts: postLoaded.posts + posts);
    } catch (_) {
      return PostError();
    }
  }
}

import 'package:aorl_apps_bloc/list/models/post_api.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<PostEvent>((event, emit) async {
      if (event is PostLoaded) {
        emit(await _mapPostToState(state));
      }

      if (event is PostRefresh) {
        emit(PostInitial());

        emit(await _mapPostToState(state));
      }
    });

    // on<PostEvent>((event, emit) async* {
    //   if (event is PostLoaded) {
    //     yield await _mapPostToState(state);
    //   }

    //   if (event is PostRefresh) {
    //     yield PostInitial();

    //     yield await _mapPostToState(state);
    //   }
    // });
    // on<PostEvent>((event, emit) => _mapPostToState(state));
  }

  Future<PostState> _mapPostToState(PostState state) async {
    List<Post> posts;

    try {
      if (state is PostInitial) {
        posts = await PostAPI.fetchPost('1');
        return PostLoaded(posts: posts);
      }
      PostLoaded postLoaded = state as PostLoaded;
      posts = await PostAPI.fetchPost('1');
      return posts.isEmpty
          ? postLoaded.copyWith(hasReachedMax: true)
          : postLoaded.copyWith(posts: postLoaded.posts + posts);
    } on Exception {
      return PostError();
    }
  }

  // Future<PostState> _mapPostToState(PostState state) async {
  //   List<Post> posts;

  //   try {
  //     if (state is PostInitial) {
  //       posts = await PostAPI.fetchPost('2');
  //       return PostLoaded(posts: posts);
  //     }

  //     PostLoaded postLoaded = state as PostLoaded;
  //     posts = await PostAPI.fetchPost('2');
  //     return posts.isEmpty
  //         ? postLoaded.copyWith(hasReachedMax: true)
  //         : postLoaded.copyWith(posts: postLoaded.posts + posts);
  //   } catch (_) {
  //     return PostError();
  //   }
  // }
}

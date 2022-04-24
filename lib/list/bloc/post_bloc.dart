import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../models/post.dart';

part 'post_event.dart';
part 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostUnInitialized()) {
    
    on<PostEvent>(
      // ignore: void_checks
      (event, emit) async* {
        List<Post> posts;

        if (state is PostUnInitialized) {
          posts = await Post.connectToAPI(1);
          yield PostLoaded(posts: posts, hasReachedMax: false);
        } else {
          PostLoaded postLoaded = state as PostLoaded;
          posts = await Post.connectToAPI(1);
          yield (posts.isEmpty)
              ? postLoaded.copyWith(hasReachedMax: true)
              : PostLoaded(
                  posts: postLoaded.posts + posts, hasReachedMax: false);
        }
      },
    );
  }
}

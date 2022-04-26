import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/post_bloc.dart';
import 'post_list.dart';

class PostBody extends StatefulWidget {
  const PostBody({
    Key? key,
  }) : super(key: key);

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  final ScrollController _scrollController = ScrollController();
  late PostBloc _postBloc;

  @override
  void initState() {
    super.initState();
    _postBloc = context.read<PostBloc>();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        print(state);
        // if Post is Initial
        if (state is PostInitial) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }

        // if Post is Loading
        if (state is PostLoaded) {
          if (state.posts.isEmpty) {
            return const Text('No Data');
          }

          return RefreshIndicator(
            onRefresh: _onRefresh,
            child: PostList(
              scrollController: _scrollController,
              state: state,
            ),
          );
        }

        // if Post is Error

        return const Center(
          child: Text('Error Fetched Posts'),
        );
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {
    double maxScroll = _scrollController.position.maxScrollExtent;
    double currentScroll = _scrollController.position.pixels;

    if (currentScroll == maxScroll) _postBloc.add(PostFetched());
  }

  Future<void> _onRefresh() async {
    _postBloc..add(PostRefresh());
  }
}

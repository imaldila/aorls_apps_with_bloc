import 'package:aorl_apps_bloc/list/bloc/post_bloc.dart';
import 'package:aorl_apps_bloc/list/screens/components/bottom_loader.dart';
import 'package:flutter/material.dart';

class PostList extends StatelessWidget {
  const PostList({
    Key? key,
    required this.scrollController,
    required this.state,
  }) : super(key: key);

  final ScrollController scrollController;
  final PostLoaded state;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount:
          state.hasReachedMax ? state.posts.length : state.posts.length + 1,
      separatorBuilder: (context, indext) => const Divider(
        thickness: 1,
      ),
      itemBuilder: (context, index) {
        if (index > state.posts.length) return const BottomLoader();

        return ListTile(
          title: Text(state.posts[index].name),
        );
      },
    );
  }
}

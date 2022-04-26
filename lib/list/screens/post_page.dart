import 'package:aorl_apps_bloc/list/models/post_api.dart';
import 'package:flutter/material.dart';
import 'components/post_body.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    int page = 2;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Page'),
      ),
      body: const PostBody(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          PostAPI.fetchPost(page.toString());
          print(page);
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

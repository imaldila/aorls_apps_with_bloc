import 'package:aorl_apps_bloc/list/bloc/post_bloc.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:flutter_bloc/flutter_bloc.dart';

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    @required this.minHeight = 150.0,
    @required this.maxHeight = 150.0,
    this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget? child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}

class CollapsingList extends StatelessWidget {
  const CollapsingList({Key? key}) : super(key: key);

  SliverPersistentHeader makeHeader(String headerText) {
    return SliverPersistentHeader(
      pinned: true,
      delegate: _SliverAppBarDelegate(
        minHeight: 150.0,
        maxHeight: 150.0,
        child: Container(
            color: Colors.lightBlue, child: Center(child: Text(headerText))),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverFixedExtentList(
            itemExtent: 150.0,
            delegate: SliverChildListDelegate(
              [
                Container(
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "Header Section 1",
                      style: TextStyle(fontSize: 16.0, color: Colors.black),
                    ),
                  ),
                )
              ],
            ),
          ),
          makeHeader('Header Section 2'),
          SliverPersistentHeader(
            pinned: false,
            delegate: _SliverAppBarDelegate(
              minHeight: 150.0,
              maxHeight: 150.0,
              child: Container(
                  color: Colors.amber,
                  child: const Center(child: const Text('headerText'))),
            ),
          ),
          BlocBuilder<PostBloc, PostState>(
            builder: (context, state) {
              return SliverFixedExtentList(
                  itemExtent: 50.0,
                  delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    // return Container(
                    //   alignment: Alignment.center,
                    //   child: Text('List item $index'),
                    // );
                    if (state is PostUnInitialized) {
                      return const Center(
                        child: SizedBox(
                          width: 30,
                          height: 30,
                          child: CircularProgressIndicator(),
                        ),
                      );
                    } else {
                      PostLoaded postLoaded = state as PostLoaded;
                      return Text(postLoaded.posts[index].email);
                    }
                  }, childCount: 10));
            },
          ),
        ],
      ),
    );
  }
}

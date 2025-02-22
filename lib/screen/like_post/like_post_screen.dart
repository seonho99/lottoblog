import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/screen/like_post/like_post_tile.dart';

import '../../data/bloc/read_posts/read_posts_bloc.dart';

class LikePostScreen extends StatefulWidget {
  LikePostScreen({super.key});

  @override
  State<LikePostScreen> createState() => _LikePostScreenState();
}

class _LikePostScreenState extends State<LikePostScreen> {

  @override
  void initState() {
    super.initState();
    // context.read<ReadPostsBloc>().add(LikeAllPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: Text(
                  '인기목록',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
              ),
              Expanded(
                child: GridView.builder(
                  itemCount: 10,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1 / 1.6,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                  ),
                  itemBuilder: (BuildContext context, int index) {
                    // return
                      // LikePostTile(
                      // imageUrl: imageUrl,
                      // title: title,
                    // );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

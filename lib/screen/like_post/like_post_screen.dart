import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/like_post/like_post_bloc.dart';
import 'package:lottoblog/data/bloc/like_post/like_post_state.dart';
import 'package:lottoblog/screen/like_post/like_post_tile.dart';

import '../../data/bloc/like_post/like_post_event.dart';
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
    context.read<LikePostBloc>().add(LikeAllPostsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '인기목록',
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall
                      ?.copyWith(fontWeight: FontWeight.w800),
                ),
                SizedBox(height: 30),
                BlocBuilder<LikePostBloc, LikePostState>(
                  builder: (context, state) {
                    if (state is LikePostsInitial) {
                      return Container();
                    } else if (state is LikePostsSuccess) {
                      return Expanded(
                        child: GridView.builder(
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 1 / 1.6,
                            mainAxisSpacing: 10,
                            crossAxisSpacing: 10,
                          ),
                          itemCount: state.likePosts.length,
                          itemBuilder: (context, index) {
                            final post = state.likePosts[index];
                            return GestureDetector(
                              onTap: (){
                                final postId = post.postId;
                                context.go('/mainhome/post/$postId');
                              },
                              child: LikePostTile(
                                imageUrl: state.likePosts[index].imageUrls[0],
                                title: state.likePosts[index].title,
                              ),
                            );
                          },
                        ),
                      );
                    } else if (state is LikePostsFailure){
                      return Center(child: Text('실패: ${state.errorMessage}'),);
                    }
                    return Center(
                      child: Text('데이터 불러오기 실패'),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

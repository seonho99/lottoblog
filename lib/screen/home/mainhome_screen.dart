import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';
import 'package:lottoblog/screen/home/post_tile.dart';

import '../../data/bloc/read_posts/read_posts_bloc.dart';
import '../../data/bloc/read_posts/read_posts_state.dart';

class MainhomeScreen extends StatefulWidget {
  MainhomeScreen({super.key});

  @override
  State<MainhomeScreen> createState() => _MainhomeScreenState();
}

class _MainhomeScreenState extends State<MainhomeScreen> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    context.read<ReadPostsBloc>().add(FetchAllPostsEvent());
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<ReadPostsBloc, ReadPostsState>(
            builder: (context, state) {
              if (state is ReadPostsInitial) {
                return Container();
              } else if (state is ReadAllPostsSuccess) {
                // print('ReadAllPosts: ${state.readAllPosts[1]}');
                return Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '커뮤니티',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemCount: state.readAllPosts.length,
                          itemBuilder: (context, index) {
                            final post = state.readAllPosts[index];
                            return GestureDetector(
                              onTap: () {
                                final postId = post.postId;
                                context.go('/mainhome/post/$postId');
                              },
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  PostTile(
                                    imageUrl:
                                        state.readAllPosts[index].imageUrls[0],
                                    title: state.readAllPosts[index].title,
                                    initialLiked:
                                        state.readAllPosts[index].likePostUid,
                                    initialLikeCount:
                                        state.readAllPosts[index].likePostCount,
                                    postId: state.readAllPosts[index].postId!,
                                    uid: state.readAllPosts[index].uid!,
                                    // userName: state.,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 16),
                                    child: Divider(
                                        color: Colors.grey.shade300,
                                        thickness: 1.0),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                );
              } else if (state is ReadPostsFailure) {
                return Center(child: Text('실패: ${state.errorMessage}'));
              }
              return Center(
                child: Text('데이터 불러오기 실패'),
              );
            },
            // ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // void _onScroll() {
  //   if (_isBottom) {
  //     if (postId != null) {
  //       context.read<PostBloc>().add(ReadAllPosts(postId: postId!, limit: limit));
  //     } else {
  //       print('postId가 null입니다.');
  //     }
  //   }
  // }

  void _onScroll() {
    if (_isBottom) context.read<ReadPostsBloc>().add(FetchAllPostsEvent());
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}

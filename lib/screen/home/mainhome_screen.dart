import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_event.dart';
import 'package:lottoblog/screen/home/post_tile.dart';

import '../../data/bloc/login/login_bloc.dart';
import '../../data/bloc/login/login_state.dart';
import '../../data/bloc/post/post_state.dart';

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

    context.read<PostBloc>().add(ReadAllPosts());
    _scrollController.addListener(_onScroll);
  }




  // @override
  // void initState() {
  //   super.initState();
  //
  //   _fetchPostId();
  //
  //   _scrollController.addListener(_onScroll);
  // }
  //
  // Future<void> _fetchPostId() async {
  //   try {
  //     List<String> postIds = await context.read<PostRepository>().getAllPostIds(posts);
  //     if (postIds.isNotEmpty) {
  //       setState(() {
  //         postId = postIds.first;
  //       });
  //
  //       context.read<PostBloc>().add(ReadAllPosts(postId: postId!, limit: limit));
  //     }
  //   } catch (e) {
  //     print('포스트 아이디를 가져오는 데 실패했습니다: $e');
  //   }
  // }
  //
  // void updatePostId(String newPostId) {
  //   setState(() {
  //     postId = newPostId;
  //   });
  //
  //
  //   if (postId != null) {
  //     context.read<PostBloc>().add(ReadAllPosts(postId: postId!, limit: limit));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginBloc, LoginState>(
      listenWhen: (previousState, currentState) {
        // print('Previous State: $previousState');
        // print('Current State: $currentState');

        return currentState is LoginAuthenticated;
      },
      listener: (context, state) {
        if (state is LoginAuthenticated) {
          print('LoginAuthenticated 상태 감지됨. ReadAllPosts 이벤트 호출');
          context.read<PostBloc>().add(ReadAllPosts());
          // print("ReadAllPosts 이벤트 추가됨");
        }
      },
      child: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state is PostInitial) {
            return Container();
          } else if (state is OpenPosts || state is LoginAuthenticated) {
            print('openPosts: ${state.openPosts}');
            return SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: Text(
                        '커뮤니티',
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall
                            ?.copyWith(fontWeight: FontWeight.w800),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: state.openPosts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PostTile(
                                imageUrl: state.openPosts[index].imageUrls[0],
                                title: state.openPosts[index].title,
                                // userName: state.,
                              ),
                              Padding(
                                padding:
                                const EdgeInsets.symmetric(vertical: 16),
                                child: Divider(
                                    color: Colors.grey.shade300,
                                    thickness: 1.0),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else if (state is PostFailure) {
            return Center(child: Text('실패: ${state.errorMessage}'));
          }
          return Center(child: Text('데이터 불러오기 실패'),);
        },
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
    if (_isBottom) context.read<PostBloc>().add(ReadAllPosts());
  }

  bool get _isBottom {
    if (_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
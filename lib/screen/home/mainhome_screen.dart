import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_bloc.dart';
import 'package:lottoblog/data/bloc/post/post_event.dart';
import 'package:lottoblog/screen/home/bottom_loader.dart';
import 'package:lottoblog/screen/home/post_tile.dart';

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

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc, PostState>(
      builder: (context, state) {
        if (state is PostInitial) {
          return Container();
        } else if (state is PostLoading) {
          return BottomLoader();
        } else if (state is PostLoaded) {
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
                        itemCount: state.posts.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PostTile(
                                imageUrl: state.posts[index].imageUrls[0],
                                title: state.posts[index].title,
                                postId: state.posts[index].postId,
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
                        }),
                  ),
                ],
              ),
            ),
          );
        } else if (state is PostFailure) {
          return Center(child: Text('실패: ${state.errorMessage}'));
        }
        return Center();
      },
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

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

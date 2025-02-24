import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_event.dart';
import 'package:lottoblog/screen/post_screen/post_screen_user.dart';

import '../../data/bloc/post_screen/post_screen_bloc.dart';
import '../../data/bloc/post_screen/post_screen_state.dart';

import '../../models/post_model.dart';
import 'post_screen_tile.dart';

class PostScreen extends StatefulWidget {
  String postId;

  // String uid;

  PostScreen({
    super.key,
    required this.postId,
    // required this.uid,
  });

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  @override
  void initState() {
    super.initState();
    context.read<PostScreenBloc>().add(FetchPostEvent(postId: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: BlocBuilder<PostScreenBloc, PostScreenState>(
            builder: (context, state) {
              // final post = state.selectedPost.firstWhere(
              //   (p) => p.postId == widget.postId,
              //   orElse: () => PostModel(
              //     postId: 'defaultId',
              //     title: 'Default Post',
              //     content: 'No content available.',
              //     imageUrls: [],
              //     uid: '',
              //     // uid: '',
              //   ),
              // );
              // print("Post UID: ${post.uid}");
              if (state is PostScreenInitial) {
                return Container();
              } else if (state is PostScreenSuccess) {
                final post = state.fetchPostScreen!;
                print('post: ${state.fetchPostScreen}');
                return SingleChildScrollView(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // postId가 들어가면 코드 로작애 uid가 아닌 postId를 넣어서 문제가 생김
                        PostScreenUser(uid: post.uid ?? ''),

                        SizedBox(height: 20),
                        Divider(
                          color: Colors.grey.shade300,
                          thickness: 1.0,
                        ),
                        SizedBox(height: 30),
                        PostScreenTile(
                          postId: widget.postId,
                          title: post.title,
                          content: post.content,
                          imageUrls: post.imageUrls,
                          // uid: post.uid,
                        ),
                      ],
                    ),
                  ),
                );
              } else if (state is PostScreenFailure) {
                return Center(
                  child: Text('실패: ${state.errorMessage}'),
                );
              }
              return Center(
                child: Text('데이터 불러오기 실패'),
              );
            },
          ),
        ),
      ),
    );
  }
}

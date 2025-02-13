import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_state.dart';
import 'package:lottoblog/data/bloc/profile/profile_bloc.dart';
import 'package:lottoblog/data/bloc/profile/profile_event.dart';
import 'package:lottoblog/screen/post_screen/post_screen_user.dart';
import '../../data/bloc/profile/profile_state.dart';
import '../../models/post_model.dart';
import 'post_screen_tile.dart';

class PostScreen extends StatefulWidget {
  String postId;
  String uid;

  PostScreen({super.key, required this.postId,required this.uid});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
    super.initState();

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
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BlocBuilder<ProfileBloc,ProfileState>(
                    builder: (context, state) {
                      return PostScreenUser(profileImageUrl: state.profileImageUrl, userName: state.userName);
                    }
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 30),
                  BlocBuilder<PostScreenBloc, PostScreenState>(
                    builder: (context, state) {
                      final post = state.selectedPost.firstWhere(
                        (p) => p.postId == widget.postId,
                        orElse: () => PostModel(
                          // Return a default PostModel if not found
                          postId: 'defaultId',
                          title: 'Default Post',
                          content: 'No content available.',
                          imageUrls: [],
                        ),
                      );

                      return PostScreenTile(
                          postId: widget.postId,
                          title: post.title,
                          content: post.content,
                          imageUrls: post.imageUrls,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

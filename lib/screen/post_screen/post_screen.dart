import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_bloc.dart';
import 'package:lottoblog/data/bloc/post_screen/post_screen_state.dart';
import '../../models/post_model.dart';
import '../../widget/popupmenubotton_widget.dart';
import 'post_screen_tile.dart';

class PostScreen extends StatelessWidget {
  String postId;
  PostScreen({super.key,required this.postId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        actions: [
          PopupmenubottonWidget(),
        ],
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
                  Row(
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:
                          Border.all(width: 1, color: Colors.grey.shade300),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/profile_dummy/profile_01.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 16),
                      Expanded(
                        child: Container(
                          width: 80,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 12),
                              Text(
                                '함께 분석해봐요',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              SizedBox(height: 4),
                              Text(
                                '2024 .10 .02',
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                            ],
                          ),
                        ),
                      ),
                      PopupmenubottonWidget(),
                    ],
                  ),
                  SizedBox(height: 20),
                  Divider(
                    color: Colors.grey.shade300,
                    thickness: 1.0,
                  ),
                  SizedBox(height: 30),
                 BlocBuilder<PostScreenBloc,PostScreenState>(
                   builder: (context,state) {
                     // final post = state.selectedPost.firstWhere(
                     //       (p) => p.postId == postId,
                     //   orElse: () => null,  // Return null if not found
                     // );
                     //
                     // if (post == null) {
                     //   return Center(child: Text('Post not found'));
                     // }
                     final post = state.selectedPost.firstWhere(
                           (p) => p.postId == postId,
                       orElse: () => PostModel(  // Return a default PostModel if not found
                         postId: 'defaultId',
                         title: 'Default Post',
                         content: 'No content available.',
                         imageUrls: [],
                       ),
                     );

                     return PostScreenTile(postId: postId, title: post.title, content: post.content, imageUrls: post.imageUrls);
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
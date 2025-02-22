import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/login/login_bloc.dart';
import 'package:lottoblog/data/bloc/login/login_state.dart';

import '../../data/bloc/read_posts/read_posts_bloc.dart';
import '../../data/bloc/read_posts/read_posts_event.dart';

import 'report_popupmenu_widget.dart';

class PostTile extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final List<String> initialLiked;
  final int initialLikeCount;
  final VoidCallback? onTap;
  final String postId;
  final String uid;

  PostTile({
    super.key,
    this.imageUrl,
    required this.title,
    required this.initialLiked,
    this.initialLikeCount = 0,
    this.onTap,
    required this.postId,
    required this.uid,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  late int likePostCount;

  @override
  void initState() {
    super.initState();
    // print('postId, uid: ${widget.postId},${widget.uid}');
    likePostCount = widget.initialLikeCount;
  }

  void toggleLike(bool isLiked) {
    setState(() {
      if (isLiked) {
        likePostCount--;
      } else {
        likePostCount++;
      }
    });

    context.read<ReadPostsBloc>().add(
          LikePostEvent(
            isLiked: !isLiked,
            likePostCount: likePostCount,
            postId: widget.postId,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.imageUrl != null && widget.imageUrl!.isNotEmpty
                    ? NetworkImage(widget.imageUrl!)
                    : const AssetImage('') as ImageProvider,
                fit: BoxFit.cover,
              ),
              border: Border.all(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Container(
                    child: Row(
                      children: [
                        Container(
                          width: 200,
                          child: Column(
                            children: [
                              Container(
                                height: 90,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        widget.title,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineMedium
                                            ?.copyWith(
                                                height: 1.6,
                                                fontWeight: FontWeight.w600),
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ),
                                    ReportPopMenuWidget(postId: widget.postId),
                                  ],
                                ),
                              ),
                              BlocBuilder<LoginBloc, LoginState>(
                                builder: (context, state) {
                                  bool isLiked = widget.initialLiked
                                      .contains(state.user?.uid);
                                  bool likeEnabled = true;
                                  if (state.user?.uid == null) {
                                    likeEnabled = false;
                                  }
                                  return Container(
                                    width: 30,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        TextButton(
                                          onPressed: () {
                                            if (likeEnabled) toggleLike(isLiked);
                                          },
                                          child: (likeEnabled)
                                              ? Icon(
                                                  Icons.favorite,
                                                  color: Colors.red,
                                                  size: 24,
                                                )
                                              : Icon(
                                                  Icons.favorite_border,
                                                  color: Colors.grey,
                                                  size: 24,
                                                ),
                                        ),
                                        Text(
                                          '$likePostCount',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleLarge
                                              ?.copyWith(
                                                  fontWeight: FontWeight.w600),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

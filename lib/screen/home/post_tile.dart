import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/login/login_bloc.dart';
import 'package:lottoblog/data/bloc/login/login_state.dart';

import '../../data/bloc/post/post_bloc.dart';
import '../../data/bloc/read_posts/read_posts_bloc.dart';
import '../../data/bloc/read_posts/read_posts_event.dart';

class PostTile extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final List<String> initialLiked;
  final int initialLikeCount;
  final VoidCallback? onTap;
  final String postId;

  PostTile({
    super.key,
    this.imageUrl,
    required this.title,
    required this.initialLiked,
    this.initialLikeCount = 0,
    this.onTap,
    required this.postId,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  late int likeCount;

  @override
  void initState() {
    super.initState();

    likeCount = widget.initialLikeCount;
  }

  void toggleLike(bool isLiked) {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
    });

    context.read<ReadPostsBloc>().add(
          LikePostEvent(
              isLiked: !isLiked, likeCount: likeCount, postId: widget.postId),
        );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap ??
          () {
            context.go('/mainhome/post/');
            //postId 이용 이동일듯
          },
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
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 90,
                  child: Text(
                    widget.title,
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                          height: 1.6,
                          fontWeight: FontWeight.w600,
                        ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
                  bool isLiked = widget.initialLiked.contains(state.user?.uid);
                  bool likeEnabled = true;
                  if (state.user?.uid == null) {
                    likeEnabled = false;
                  }
                  return Row(
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
                        '$likeCount',
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge
                            ?.copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  );
                }),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

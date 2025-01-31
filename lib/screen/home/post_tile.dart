import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class PostTile extends StatefulWidget {
  final String? imageUrl;
  final String title;
  final bool initialLiked;
  final int initialLikeCount;
  final VoidCallback? onTap;

  PostTile({
    super.key,
    this.imageUrl,
    required this.title,
    this.initialLiked = false,
    this.initialLikeCount = 0,
    this.onTap,
  });

  @override
  State<PostTile> createState() => _PostTileState();
}

class _PostTileState extends State<PostTile> {
  late bool isLiked;
  late int likeCount;

  @override
  void initState() {
    super.initState();
    isLiked = widget.initialLiked;
    likeCount = widget.initialLikeCount;
  }

  void toggleLike() {
    setState(() {
      if (isLiked) {
        likeCount--;
      } else {
        likeCount++;
      }
      isLiked = !isLiked;
    });
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
                    : const AssetImage('assets/placeholder.png')
                        as ImageProvider,
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    const SizedBox(width: 8),
                    Text(
                      '$likeCount',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge
                          ?.copyWith(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

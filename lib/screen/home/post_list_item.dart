import 'package:flutter/material.dart';
import 'package:lottoblog/models/post_model.dart';

class PostListItem extends StatelessWidget {
  final PostModel posts;
  PostListItem({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Material(
      child: ListTile(
        leading: Text('${posts.postId}',style: textTheme.bodySmall,),
        title: Text(posts.title),
        isThreeLine: true,
        subtitle: Text(posts.content),
        dense: true,
      ),
    );
  }
}

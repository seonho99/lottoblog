import 'package:flutter/material.dart';

class LikePostTile extends StatelessWidget {
  String imageUrl;
  String title;

  LikePostTile({
    super.key,
    required this.imageUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        image: DecorationImage(
            image: imageUrl.isNotEmpty
                ? NetworkImage(imageUrl)
                : const AssetImage('') as ImageProvider,
            fit: BoxFit.cover),
      ),
      child: Stack(
        alignment: Alignment.bottomLeft,
        children: [
          Text('$title',style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),),
        ],
      )
    );
  }
}

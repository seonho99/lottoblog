import 'package:flutter/material.dart';

class LikeWidget extends StatelessWidget {
  final bool isLiked;
  final Function()? onTap;

  LikeWidget(this.isLiked, this.onTap);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Icon(isLiked ? Icons.favorite : Icons.favorite_border,
        color: isLiked ? Colors.red : Colors.grey,
      ),
    );
  }
}

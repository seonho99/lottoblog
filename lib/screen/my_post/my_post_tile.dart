import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottoblog/data/bloc/my_post/my_post_bloc.dart';
import 'package:lottoblog/data/bloc/my_post/my_post_event.dart';


import '../home/report_popupmenu_widget.dart';

class MyPostTile extends StatefulWidget {
  String? imageUrl;
  String title;
  String postId;
  int likePostCount;

  MyPostTile({
    super.key,
    this.imageUrl,
    required this.title,
    required this.postId,
    this.likePostCount=0,
    // required this.userName,
  });

  @override
  State<MyPostTile> createState() => _MyPostTileState();
}

class _MyPostTileState extends State<MyPostTile> {
  late int likePostCount;

  @override
  void initState() {
    super.initState();

    likePostCount = widget.likePostCount;

    context.read<MyPostBloc>().add(MyLikeCountEvent(likePostCount: likePostCount, postId: widget.postId));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
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
        Container(
          child: Column(
            children: [
              Container(
                child: Row(
                  children: [
                    Container(
                      width: 220,
                      child: Column(
                        children: [
                          Container(
                            height: 80,
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
                                            height: 1.6, fontWeight: FontWeight.w600),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                ReportPopMenuWidget(postId: widget.postId),
                              ],
                            ),
                          ),
                          Container(
                            height: 30,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.end,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(
                                  Icons.favorite,
                                  color: Colors.red,
                                  size: 24,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  '$likePostCount',
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleLarge
                                      ?.copyWith(fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ReportPopMenuWidget(),
                  ],
                ),
              ),

            ],
          ),
        ),
      ],
    );
  }
}

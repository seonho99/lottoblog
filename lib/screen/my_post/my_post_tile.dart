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
    return GestureDetector(
      onTap: () {
        context.go('/mainhome/post_screen/${widget.postId}');
        //postId 이용 이동일듯,
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 120,
            height: 120,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(widget.imageUrl ?? ''),
                fit: BoxFit.cover,
                onError: (_, __) {
                  //networkImage error처리
                },
              ),
              border: Border.all(width: 1, color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          const SizedBox(width: 14),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width:220,
                  child: Row(
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
                      // ReportPopMenuWidget(),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  // Expanded(child: Text(userName,
                  // style: Theme.of(context).textTheme.titleMedium,),),
                  Icon(
                    Icons.favorite,
                    color: Colors.red,
                    size: 24,
                  ),
                  const SizedBox(width: 14,),
                  Text(
                    '$likePostCount',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge
                        ?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

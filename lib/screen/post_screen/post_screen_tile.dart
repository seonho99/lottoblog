import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/post_screen/post_screen_bloc.dart';
import '../../data/bloc/post_screen/post_screen_event.dart';

class PostScreenTile extends StatefulWidget {
  String postId;
  String title;
  String content;
  List<String> imageUrls;
  String? uid;

  PostScreenTile({
    super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
    // required this.uid,
  });

  @override
  State<PostScreenTile> createState() => _PostScreenTileState();
}

class _PostScreenTileState extends State<PostScreenTile> {
  @override
  void initState() {
    super.initState();
    context.read<PostScreenBloc>().add(
          FetchPost(
            postId: widget.postId,
            title: widget.title,
            content: widget.content,
            imageUrls: widget.imageUrls,
          ),
        );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: Theme.of(context)
              .textTheme
              .displayMedium
              ?.copyWith(height: 1.6, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 40),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey.shade300),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 6,
            itemBuilder: (context, index) {
              int imageIndex = index ~/ 2;

              if (index.isEven) {
                return widget.imageUrls.length > imageIndex
                    ? Image.network(
                        widget.imageUrls[imageIndex],
                        fit: BoxFit.cover,
                      )
                    : Container();
              } else {
                return SizedBox(height: 10);
              }
            },
          ),
          // ListView.builder(
          //   itemCount: widget.imageUrls.length,
          //   itemBuilder: (context, index) {
          //     return Image(
          //       image: NetworkImage(widget.imageUrls[index]),
          //       fit: BoxFit.cover,
          //     );
          //   },
          // ),
        ),
        SizedBox(height: 40),
        Text(
          widget.content,
          style:
              Theme.of(context).textTheme.headlineMedium?.copyWith(height: 1.6),
        ),
      ],
    );
  }
}

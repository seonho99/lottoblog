import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/post_screen/post_screen_bloc.dart';
import '../../data/bloc/post_screen/post_screen_event.dart';

class PostScreenTile extends StatefulWidget {
  String postId;
  String title;
  String content;
  List<String> imageUrls;

  PostScreenTile({super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
  });

  @override
  State<PostScreenTile> createState() => _PostScreenTileState();
}



class _PostScreenTileState extends State<PostScreenTile> {

  @override
  void initState() {
    super.initState();
    context.read<PostScreenBloc>().add(FetchPost(postId: widget.postId, title: widget.title, content: widget.content, imageUrls: widget.imageUrls));
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          widget.title,
          style: Theme.of(context).textTheme.displaySmall
              ?.copyWith(height: 1.6, fontWeight: FontWeight.w700),
        ),
        SizedBox(height: 20),
        Container(
          width: MediaQuery.of(context).size.width * 1,
          height: 300,
          decoration: BoxDecoration(
            border: Border.all(width: 1, color: Colors.grey.shade300),
          ),
          child: ListView.builder(
              itemCount: widget.imageUrls.length,
              itemBuilder: (context, index){
                return Image(image: NetworkImage(widget.imageUrls[index]),
                  fit: BoxFit.cover,);
              }
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            widget.content,
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(height: 1.6),
          ),
        ),
      ],
    );
  }
}


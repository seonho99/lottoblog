import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/read_posts/read_posts_event.dart';

import '../../data/bloc/read_posts/read_posts_bloc.dart';

enum SampleItem {itemOne}

class DeletePopupWidget extends StatefulWidget {
  final String postId;

  DeletePopupWidget({super.key, required this.postId});

  @override
  State<DeletePopupWidget> createState() => _DeletePopupWidgetState();
}

class _DeletePopupWidgetState extends State<DeletePopupWidget> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      icon: Container(
        width: 10,
        height: 20,
        child: Column(
          children: [
            Icon(Icons.circle, size: 6),
            Icon(Icons.circle, size: 6),
            Icon(Icons.circle, size: 6),
          ],
        ),
      ),
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          child: TextButton(
            onPressed: () {
              context.read<ReadPostsBloc>().add(DeletePostEvent(postId: widget.postId));
            },
            child: Text(
              '삭제하기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
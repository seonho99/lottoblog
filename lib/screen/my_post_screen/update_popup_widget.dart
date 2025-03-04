import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';


enum SampleItem {itemOne}

class UpdatePopupWidget extends StatefulWidget {
  final String postId;

  UpdatePopupWidget({super.key, required this.postId});

  @override
  State<UpdatePopupWidget> createState() => _UpdatePopupWidgetState();
}

class _UpdatePopupWidgetState extends State<UpdatePopupWidget> {
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
              final postId = widget.postId;
              context.go('/personal/post/$postId/update_post');
            },
            child: Text(
              '수정하기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
import 'dart:io';

import 'package:flutter/material.dart';

class PostUpdateTile extends StatefulWidget {
  String postId;
  String title;
  String content;
  List<String> imageUrls;

  // String? uid;

  PostUpdateTile({
    super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
    // required this.uid,
  });

  @override
  State<PostUpdateTile> createState() => _PostUpdateTileState();
}

class _PostUpdateTileState extends State<PostUpdateTile> {
  void _addImage(File image) {
    setState(() {
      widget.imageUrls.add(image.path);
    });
  }

  void _removeImage(int index) {
    setState(() {
      widget.imageUrls.removeAt(index);
    });
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
        // Container(
        //   width: double.infinity,
        //   decoration: BoxDecoration(
        //     border: Border.all(width: 1, color: Colors.grey.shade300),
        //   ),
        //   child: GridView.builder(
        //     shrinkWrap: true,
        //     physics: NeverScrollableScrollPhysics(),
        //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        //       crossAxisCount: 3,
        //       crossAxisSpacing: 8,
        //       mainAxisSpacing: 8,
        //     ),
        //     itemCount: widget.imageUrls.length + 1,
        //     itemBuilder: (context, index) {
        //       if (index < widget.imageUrls.length) {
        //         return Stack(
        //           children: [
        //             Image.network(
        //               widget.imageUrls[index],
        //               fit: BoxFit.cover,
        //               height: 100,
        //               width: 100,
        //             ),
        //             Positioned(
        //               top: 5,
        //               right: 5,
        //               child: IconButton(
        //                 onPressed: () => _removeImage(index),
        //                 icon: Icon(
        //                   Icons.delete,
        //                   color: Colors.white,
        //                 ),
        //               ),
        //             ),
        //           ],
        //         );
        //       } else {
        //         return GestureDetector(
        //           onTap: () async {
        //             File image = File('path_to_image');
        //             _addImage(image);
        //           },
        //           child: Container(
        //             color: Colors.grey.shade200,
        //             child: Icon(
        //               Icons.add_a_photo_outlined,
        //               size: 45,
        //               color: Colors.grey,
        //             ),
        //           ),
        //         );
        //       }
        //     },
        //   ),
        // ),
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

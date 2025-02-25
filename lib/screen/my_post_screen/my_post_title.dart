import 'package:flutter/material.dart';

class MyPostTile extends StatefulWidget {
  String postId;
  String title;
  String content;
  List<String> imageUrls;

  // String? uid;

  MyPostTile({
    super.key,
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
    // required this.uid,
  });

  @override
  State<MyPostTile> createState() => _MyPostTileState();
}

class _MyPostTileState extends State<MyPostTile> {
  // @override
  // void initState() {
  //   super.initState();
  //}

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

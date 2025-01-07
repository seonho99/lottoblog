import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/popupmenubotton_widget.dart';

class PostTile extends StatelessWidget {
  String? imageUrl;
  String title;
  String? postId;


  PostTile({super.key,this.imageUrl,required this.title, this.postId});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/mainhome/post_screen');
        //postId 이용 이동일듯,
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Container(
              width: 130,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(imageUrl??''),
                  fit: BoxFit.cover,
                  onError: (_,__){
                    //networkImage error처리
                  },

                ),
                border: Border.all(
                    width: 1, color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 40),
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.56,
                  child: Row(
                    children: [
                      Expanded(
                        child: Text(
                          title,
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall
                              ?.copyWith(height: 1.6),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PopupmenubottonWidget(),
                    ],
                  ),
                ),
              ),
              Icon(Icons.favorite_outline),
            ],
          ),
        ],
      ),
    );
  }
}

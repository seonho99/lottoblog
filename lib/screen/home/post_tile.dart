import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../widget/popupmenubotton_widget.dart';

class PostTile extends StatelessWidget {
  String? imageUrl;
  String title;
  String? postId;
  String? userName;

  PostTile({super.key,this.imageUrl,required this.title, this.postId,
    // required this.userName,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.go('/mainhome/post/$postId');
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
                image: NetworkImage(imageUrl ?? ''),
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
          const SizedBox(width: 14),
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
                          style: Theme.of(context).textTheme.headlineMedium
                              ?.copyWith(height: 1.6,fontWeight: FontWeight.w600),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      PopupmenubottonWidget(),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  // Expanded(child: Text(userName,
                  // style: Theme.of(context).textTheme.titleMedium,),),
                  Icon(Icons.favorite_outline),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

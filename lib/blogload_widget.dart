import 'package:flutter/material.dart';

class BlogLoadWidget extends StatelessWidget {
  const BlogLoadWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Container(
                height: 130,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '제목 30글자 까지',
                            //
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ),
                        Icon(Icons.more_vert,size: 30),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '닉네임 10글자까지 ',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        Row(
                          children: [
                            Icon(Icons.favorite,size:18),
                            SizedBox(width: 5),
                            Text('1',
                              style: Theme.of(context).textTheme.titleMedium,),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        SizedBox(height: 15),
        Divider(color: Colors.grey, thickness: 1.0),
        SizedBox(height: 15),
      ],
    );
  }
}

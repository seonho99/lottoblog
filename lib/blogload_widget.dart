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
              height: 100,
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: Colors.grey.shade50),
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'qwkfewklfa',
                            style: Theme.of(context).textTheme.headlineMedium,
                          ),
                        ),
                        Icon(Icons.more_vert,size: 30),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '아이디',
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
        Container(
          child: Divider(color: Colors.grey, thickness: 1.0),
          padding: EdgeInsets.only(top: 15, bottom: 15),
        ),
      ],
    );
  }
}

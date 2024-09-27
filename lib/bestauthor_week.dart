import 'package:flutter/material.dart';

class BestAuthorWeek extends StatelessWidget {
  const BestAuthorWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(left: 10),
          width: 300,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 1.0),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 300,
              height: 80,
              // decoration: BoxDecoration(
              //   border: Border.all(width: 1,
              //   color: Colors.black),
              // ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: Row(
                  children: [
                    CircleAvatar(radius: 35),
                    SizedBox(width: 10),
                    Expanded(
                      // Column이 전체 Row의 남은 공간을 차지하도록 설정
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start, // 왼쪽 정렬
                        children: [
                          Text(
                            'qwkfewklfa',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Row(
                            children: [
                              Spacer(), // 오른쪽 정렬을 위해 Spacer 사용
                              Text(
                                '아이디',
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

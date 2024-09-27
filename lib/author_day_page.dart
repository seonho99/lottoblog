import 'package:flutter/material.dart';
import 'reader_can_use.dart';
import 'bestauthor_week.dart';

class AuthorDay extends StatelessWidget {
  AuthorDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Text(
                  '- 회 당첨번호',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20),
                Container(
                  height: 60,
                  child: Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: Container(
                            child: CircleAvatar(
                              radius: 20,
                              child: Text(
                                '1',
                                style:
                                    Theme.of(context).textTheme.headlineSmall,
                              ),
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '2',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '3',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '4',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '5',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '6',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                        Icon(
                          Icons.add,
                          size: 25,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey,
                              width: 1,
                            ),
                          ),
                          child: CircleAvatar(
                            radius: 20,
                            child: Text(
                              '71',
                              style: Theme.of(context).textTheme.headlineSmall,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey, thickness: 1.0),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '월',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '화',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '수',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '목',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '금',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '토',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                    Text(
                      '일',
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Best',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                      textAlign: TextAlign.start,
                    ),
                  ],
                ),
                SizedBox(height: 15),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      BestAuthorWeek(),
                      BestAuthorWeek(),
                      BestAuthorWeek(),
                      BestAuthorWeek(),
                      BestAuthorWeek(),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Divider(color: Colors.grey, thickness: 1.0),
                SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Text('최신순',
                              style: Theme.of(context).textTheme.titleMedium),
                          SizedBox(width: 16),
                          Text('좋아요',
                              style: Theme.of(context).textTheme.titleMedium),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 15),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'reader_can_use.dart';
import 'bestauthor_week.dart';

class AuthorDay extends StatelessWidget {
  AuthorDay({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: SafeArea(
            child: Column(
              children: [
                Column(
                  children: [
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
                    Row(
                      children: [
                        Text(
                          '주간 Best',
                          style: TextStyle(
                              fontSize: 30, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20),
                      child: SingleChildScrollView(
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
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: Container(
                            child: Row(
                              children: [
                                Text('최신순',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                                SizedBox(width: 16),
                                Text('좋아요',
                                    style: Theme.of(context)
                                        .textTheme
                                        .titleMedium),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    ReaderCanUse(),
                    ReaderCanUse(),
                    ReaderCanUse(),
                    ReaderCanUse(),
                    ReaderCanUse(),
                    ReaderCanUse(),
                    ReaderCanUse(),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

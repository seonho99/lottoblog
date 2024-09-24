import 'package:flutter/material.dart';
import 'bestauthor_week.dart';
import 'reader_can_use.dart';

class MainhomePage extends StatelessWidget {
  const MainhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Text(
                    'Lotto Blog',
                    style: TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  children: [
                    Container(
                      // margin: EdgeInsets.only(bottom: 30),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      // margin: EdgeInsets.only(bottom: 30),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Text(
                  '- 현재 회차 -',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                Container(
                  margin: EdgeInsets.only(top: 10),
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => Expanded(
                        child: CircleAvatar(
                          radius: 25,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 24,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Divider(color: Colors.grey, thickness: 1.0),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
                Row(
                  children: [
                    Text(
                      '주간 Best',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                ),
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
                Container(
                  child: Divider(color: Colors.grey, thickness: 1.0),
                  padding: EdgeInsets.only(top: 15, bottom: 15),
                ),
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
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 15),
                      child: Container(
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.yellow),
                            ),
                            SizedBox(width: 7),
                            Text('최신순',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(width: 10),
                            Container(
                              width: 20,
                              height: 20,
                              decoration: BoxDecoration(color: Colors.yellow),
                            ),
                            SizedBox(width: 7),
                            Text('좋아요',
                                style: Theme.of(context).textTheme.titleMedium),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}

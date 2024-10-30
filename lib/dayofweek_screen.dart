import 'package:flutter/material.dart';
import 'package:lottoblog/dayofweek_class.dart';

class DayOfWeekScreen extends StatelessWidget {
  DayOfWeekScreen({super.key});

  List<DayofweekClass> dayofweeks =[

    DayofweekClass(
        postImage: 'image_dummy_01.png',
        postTitle: '2024 10 02 로또 5,000원 샀습니다.'),

    DayofweekClass(
        postImage: 'image_dummy_02.png',
        postTitle: '왜 핑이 들어갈까?'),

    DayofweekClass(
        postImage: 'image_dummy_03.png',
        postTitle: '윈터 너무 예쁘다 ♥ aespa Winter is so pretty'),

    DayofweekClass(
        postImage: 'image_dummy_04.png',
        postTitle: '세계 최고 부자가 일런머스크가 말하는 6가지 성공 비결'),

    DayofweekClass(
        postImage: 'image_dummy_05.png',
        postTitle: 'He is Not Korean'),
  ];

  List<Widget> getDayofweeks(BuildContext context){
    List<Widget> dayofweekList = [];

    for (var i = 0; i<dayofweeks.length; i++){
      var image = dayofweeks[i].postImage;
      var title = dayofweeks[i].postTitle;

      dayofweekList.add(
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Container(
                width: 210,
                height: 335,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 250,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color: Colors.grey.shade200, width: 1.0),
                        image: DecorationImage(
                          image: AssetImage(
                              'assets/image_dummy/$image'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text(
                      '$title',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(fontWeight: FontWeight.w700),
                      maxLines: 2,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(Icons.favorite_outline, size: 16),
                        SizedBox(width: 4),
                        Text('1,000,000',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium),
                      ],
                    ),
                  ],
                ),
              ),
            SizedBox(width: 15),
          ],
        ),
      );
    }
    return dayofweekList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('인기글',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child:Row(
                  children: getDayofweeks(context),
                  ),
                ),
                SizedBox(height: 10),
                Divider(color: Colors.grey.shade300, thickness: 1.0),
                SizedBox(height: 10),
                Row(
                  children: [
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('로또 게시판',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            SizedBox(height: 20),
                            Row(
                              children: [
                                Text('[로또]',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text('2024 10 02 로또 5,000원 샀습니다.',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                            SizedBox(height: 20),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('자유 게시판',
                                style: Theme.of(context).textTheme.titleMedium),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey,
                              height: 1,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('[자유]',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                            fontWeight: FontWeight.bold)),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text('핑이 들어갈까?',
                                      style:
                                          Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('[자유]',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text('윈터 너무 예쁘다 ♥ aespa Winter is so pretty?',
                                      style:
                                      Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                            SizedBox(height: 15),
                            Row(
                              children: [
                                Text('[자유]',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge
                                        ?.copyWith(
                                        fontWeight: FontWeight.bold)),
                                SizedBox(width: 6),
                                Expanded(
                                  child: Text('세계 최고 부자가 일런머스크가 말하는 6가지 성공 비결',
                                      style:
                                      Theme.of(context).textTheme.bodyLarge,
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis),
                                ),
                              ],
                            ),
                            SizedBox(height: 15),
                            Divider(
                              color: Colors.grey.shade300,
                              height: 1,
                            ),
                          ],
                        ),
                      ),
                    ),
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

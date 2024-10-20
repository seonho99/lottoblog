import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'mainhome_class.dart';
import 'popupmenubotton_widget.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});

  List<MainhomeClass> mainhomes = [
    MainhomeClass(
        postImage: 'image_dummy_01.png',
        postTitle: '2024 10 02 로또 5,000원 샀습니다.',
        postName: '함께 분석해봐요'),
    MainhomeClass(
        postImage: 'image_dummy_02.png',
        postTitle: '왜 핑이 들어갈까?',
        postName: '하츄핑 로얄핑'),
    MainhomeClass(
        postImage: 'image_dummy_03.png',
        postTitle: '윈터 너무 예쁘다 ♥ aespa Winter is so pretty',
        postName: '수수수 수퍼노바'),
    MainhomeClass(
        postImage: 'image_dummy_04.png',
        postTitle: '세계 최고 부자가 일런머스크가 말하는 6가지 성공 비결',
        postName: 'thisis멜론머스크'),
    MainhomeClass(
        postImage: 'image_dummy_05.png',
        postTitle: 'He is Not Korean',
        postName: '슈카형필립스광고'),
  ];

  List<Widget> getHomeList(BuildContext context) {
    List<Widget> homeList = [];
    for (var i = 0; i < mainhomes.length; i++) {
      var image = mainhomes[i].postImage;
      var title = mainhomes[i].postTitle;
      var name = mainhomes[i].postName;
      homeList.add(
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image_dummy/$image'),
                          fit: BoxFit.cover,
                        ),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: SizedBox(
                    height: 130,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 185,
                              child: Text(
                                '$title',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(height: 1.6),
                              ),
                            ),
                            const Spacer(),
                            Expanded(child: PopupmenubottonWidget()),
                            // Icon(Icons.more_vert, size: 30),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '$name',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Spacer(),
                            Row(
                              children: [
                                Icon(Icons.favorite, size: 18),
                                SizedBox(width: 5),
                                Text(
                                  '1,000,000',
                                  style: TextStyle(fontSize: 16),
                                ),
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
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300, thickness: 1.0),
            SizedBox(height: 15),
          ],
        ),
      );
    }
    if (homeList.isNotEmpty) {
      (homeList.last as Column).children.removeLast();
      (homeList.last as Column).children.removeLast();
    }
    return homeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('최신글',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                context.go('/mainhome_screen/blogpost_screen01');
              },
              child: Column(
                children: getHomeList(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

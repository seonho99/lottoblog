import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayOfWeekScreen extends StatelessWidget {
  const DayOfWeekScreen({super.key});

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
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          context.go('/dayofweek_screen/blogpost_screen01');
                        },
                        child: Container(
                          width: 210,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(
                                      color: Colors.grey.shade200, width: 1.0),
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/image_dummy/image_dummy_01.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(height: 15),
                              Text(
                                '2024 10 02 로또 5,000원 샀습니다.',
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
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.grey.shade300, thickness: 1.0),
                SizedBox(height: 20),
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

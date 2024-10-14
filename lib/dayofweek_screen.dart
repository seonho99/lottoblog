import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'popupmenubotton_widget.dart';


class DayOfWeekScreen extends StatelessWidget {
  const DayOfWeekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('인기글', style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontWeight: FontWeight.bold)),
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
                        onTap:(){
                          context.go('/dayofweek_screen/blogpost_screen01');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 210,
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/profile_dummy/profile_01.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        '함께 분석해봐요',
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.favorite, size: 20),
                                          const SizedBox(width: 5),
                                          Text('1,000,000',
                                              style: Theme.of(context).textTheme.titleMedium),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Expanded(child: PopupmenubottonWidget()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: 210,
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
                          ],
                        ),
                      ),
                      const SizedBox(width: 15),
                      GestureDetector(
                        onTap:(){
                          context.go('/dayofweek_screen/blogpost_screen01');
                        },
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 210,
                              child:
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 49,
                                    height: 49,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      image: const DecorationImage(
                                        image: AssetImage(
                                            'assets/profile_dummy/profile_01.png'),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(width: 10),
                                  Column(
                                    children: [
                                      Text(
                                        '함께 분석해봐요',
                                        style: Theme.of(context).textTheme.titleMedium,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Row(
                                        children: [
                                          const Icon(Icons.favorite, size: 20),
                                          const SizedBox(width: 5),
                                          Text('1,000,000',
                                              style: Theme.of(context).textTheme.titleMedium),
                                        ],
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Expanded(child: PopupmenubottonWidget()),
                                ],
                              ),
                            ),
                            const SizedBox(height: 15),
                            Container(
                              width: 210,
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
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Divider(color: Colors.grey.shade300, thickness: 1.0),
                SizedBox(height: 20),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center, // 중앙 정렬
                      children: [
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(
                            Icons.autorenew,
                            size: 20,
                            color: Colors.black87,
                          ),
                          label: Text('최신순',
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                        const SizedBox(width: 20),
                        ElevatedButton.icon(
                          onPressed: () {},
                          icon: Icon(Icons.favorite,
                              size: 20, color: Colors.redAccent),
                          label: Text('좋아요',
                              style: Theme.of(context).textTheme.titleMedium),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    GestureDetector(
                      onTap: () {
                        context.go('/dayofweek_screen/blogpost_screen01');
                      },
                      child: Column(
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/image_dummy/image_dummy_01.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 230,
                                height: 130,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 190,
                                          child: Text(
                                            '2024 10 02 로또 5,000원 샀습니다.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(height: 1.6),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(child: PopupmenubottonWidget()),
                                        // Icon(Icons.more_vert, size: 30),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '함께 분석해봐요',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const Spacer(),
                                        const Row(
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
                            ],
                          ),
                          const SizedBox(height: 15),
                          Divider(color: Colors.grey.shade300, thickness: 1.0),
                          const SizedBox(height: 15),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: 100,
                                height: 130,
                                decoration: BoxDecoration(
                                  image: const DecorationImage(
                                    image: AssetImage(
                                        'assets/image_dummy/image_dummy_01.png'),
                                    fit: BoxFit.cover,
                                  ),
                                  border: Border.all(
                                      width: 1, color: Colors.grey.shade300),
                                ),
                              ),
                              const SizedBox(width: 10),
                              SizedBox(
                                width: 230,
                                height: 130,
                                child: Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          width: 200,
                                          child: Text(
                                            '2024 10 02 로또 5,000원 샀습니다.',
                                            style: Theme.of(context)
                                                .textTheme
                                                .headlineSmall
                                                ?.copyWith(height: 1.6),
                                          ),
                                        ),
                                        Spacer(),
                                        Expanded(child: PopupmenubottonWidget()),
                                        // Icon(Icons.more_vert, size: 30),
                                      ],
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          '함께 분석해봐요',
                                          style: Theme.of(context)
                                              .textTheme
                                              .titleMedium,
                                        ),
                                        const Spacer(),
                                        const Row(
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
                            ],
                          ),
                          const SizedBox(height: 15),
                          Divider(color: Colors.grey.shade300, thickness: 1.0),
                          const SizedBox(height: 15),
                        ],
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
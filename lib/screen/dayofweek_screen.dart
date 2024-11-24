import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DayofweekScreen extends StatelessWidget {
  const DayofweekScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Text('이번주 행운 가득 후기',
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: (){
                          context.go('/mainhome/post_screen');
                        },
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Container(
                                width: 200,
                                height: 250,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border:
                                      Border.all(color: Colors.grey.shade200, width: 1.0),
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'assets/image_dummy/image_dummy_01.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              height: 50,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text('이번주도 구매 완료',
                                  style: Theme.of(context).textTheme.titleMedium),
                                  Icon(Icons.favorite)
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 200,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border.all(color: Colors.grey.shade200, width: 1.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/image_dummy/image_dummy_01.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('이번주도 구매 완료',
                                    style: Theme.of(context).textTheme.titleMedium),
                                Icon(Icons.favorite)
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              width: 200,
                              height: 250,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border:
                                Border.all(color: Colors.grey.shade200, width: 1.0),
                                image: DecorationImage(
                                  image: AssetImage(
                                      'assets/image_dummy/image_dummy_01.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 200,
                            height: 50,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('이번주도 구매 완료',
                                    style: Theme.of(context).textTheme.titleMedium),
                                Icon(Icons.favorite)
                              ],
                            ),
                          ),
                        ],
                      ),
                      
                    ],
                  ),
                ),
                
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Text('이번주 핫한 이슈',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.w600),
                  ),
                ),

                GestureDetector(
                  onTap: (){
                    context.go('/dayofweek/post_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('이번주도 구매 완료',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text('닉네임',style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(color: Colors.grey.shade300, thickness: 1.0),
                ),

                GestureDetector(
                  onTap: (){
                    context.go('/dayofweek/post_screen');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('이번주도 구매 완료',
                        style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w600),
                      ),
                      Text('닉네임',style: Theme.of(context).textTheme.titleMedium),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Divider(color: Colors.grey.shade300, thickness: 1.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

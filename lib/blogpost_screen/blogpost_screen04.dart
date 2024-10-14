import 'package:flutter/material.dart';

const TextStyle headlineMedium = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
const TextStyle titleSmallGrey = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);

class BlogPostScreen04 extends StatelessWidget {
  const BlogPostScreen04({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      width: 49,
                      height: 49,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.grey[300]!),
                        image: const DecorationImage(
                          image:
                          AssetImage('assets/profile_dummy/profile_04.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'thisis멜론머스크',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        const Text(
                          '2024 .10 .02',
                          style: titleSmallGrey,
                        ),
                      ],
                    ),
                    const Spacer(),
                    const Icon(Icons.more_vert, size: 30),
                  ],
                ),
                const SizedBox(height: 24),
                const Text(
                  '세계 최고 부자가 일런머스크가 말하는 6가지 성공 비결',
                  style: headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  '돈이 중요한 것이 아니다\n열정을 좇아라\n목표를 크게 가지는 것을 두려워하지 말라\n모험할 준비를 하라\n비판을 무시하라\n즐겨라',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                const SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1, color: Colors.grey[300]!),
                        ),
                        child: const Image(
                          image: AssetImage(
                              'assets/image_dummy/image_dummy_04.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
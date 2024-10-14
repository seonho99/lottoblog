import 'package:flutter/material.dart';
import 'package:LottoBlog/blogpost_screen/blogpost_dummy.dart';

const TextStyle headlineMedium = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);
const TextStyle titleSmallGrey = TextStyle(
  fontSize: 14,
  color: Colors.grey,
);

class BlogPostScreen03 extends StatelessWidget {
  const BlogPostScreen03({super.key});

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
                          AssetImage('assets/profile_dummy/profile_03.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '수수수 수퍼노바',
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
                  '윈터 너무 예쁘다 ♥ aespa Winter is so pretty',
                  style: headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  '사건은 다가와 Ah Oh Ay,\n거세게 커져가 Ah Oh Ay\nBring the ligth of a dying star\n불러낸 내 우주를 봐 봐\nNova\nSupernova ',

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
                        child: Image(
                          image: AssetImage(
                              'assets/image_dummy/image_dummy_03.png'),
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
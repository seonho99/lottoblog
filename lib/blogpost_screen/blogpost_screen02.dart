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

class BlogPostScreen02 extends StatelessWidget {
  const BlogPostScreen02({super.key});

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
                          AssetImage('assets/profile_dummy/profile_02.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '하츄핑 로얄핑',
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
                  '핑이 들어갈까?',
                  style: headlineMedium,
                ),
                const SizedBox(height: 16),
                Text(
                  '사랑의 티니핑. 늘 로미와 함께 다니며 애교 넘치는 로열핑으로, 사랑과 배려가 넘치는 성격. 티니핑 중 로미와 가장 친하며, 비밀의 방에 있던 티니핑 봉인이 풀려나 지구로 흩어질 때 로미가 손을 꼭 잡아준 덕분에 유일무이하게 지구로 떨어지지 않고 로미와 함께 처음부터 같이 다녔으며, 모든 티니핑 중 유일무이하게 모든 회차와 시즌에 출연 중이다.',
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
                              'assets/image_dummy/image_dummy_02.png'),
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
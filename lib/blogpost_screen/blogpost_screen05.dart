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

class BlogPostScreen05 extends StatelessWidget {
  const BlogPostScreen05({super.key});

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
                          AssetImage('assets/profile_dummy/profile_05.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '슈카형필립스광고',
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
                  'He is Not Korean',
                  style: headlineMedium, // 올바른 변수 이름과 클래스 접근
                ),
                const SizedBox(height: 16),
                Text(
                  '단기간에 큰 성과를 내야하는 투자? 그거 엄청 괴롭다. 나도 펀드매니저로 해봤다. 펀드매니저는 그나마 남의 돈 이지만, 여러분은 그러지 않는다 이런걸 좋아서 하는 사람이 어딨냐, 중독자도 아니고 다들 스트레스 받으면서 한다. 사회가 시켜서 한다 어른들은 젊은 사람들이 이렇게 하는거에 미안해야 한다. 이런식의 투자는 괴롭다. 우린 저렇게 투자하지 않지 않았나?',
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
                              'assets/image_dummy/image_dummy_05.png'),
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
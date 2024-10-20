import 'package:flutter/material.dart';
import 'package:lottoblog/popupmenubotton_widget.dart';

class BlogPostScreen01 extends StatelessWidget {
  BlogPostScreen01({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
      ),
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
                          AssetImage('assets/profile_dummy/profile_01.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '함께 분석해봐요',
                          style: Theme.of(context).textTheme.headlineSmall,
                        ),
                        Text(
                          '2024 .10 .02',
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ],
                    ),
                    Spacer(),
                    PopupmenubottonWidget(),
                    // Icon(Icons.more_vert, size: 30),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  '2024 10 02 로또 5,000원 샀습니다.',
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(height: 1.6),
                ),
                const SizedBox(height: 20),
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
                              'assets/image_dummy/image_dummy_01.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1, color: Colors.grey[300]!),
                        ),
                        child: const Image(
                          image: AssetImage(
                              'assets/image_dummy/image_dummy_06.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border:
                          Border.all(width: 1, color: Colors.grey[300]!),
                        ),
                        child: Image(
                          image: AssetImage(
                              'assets/image_dummy/image_dummy_07.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24),
                Text(
                  '복권을 구매하면 기분이 좋아져서 꾸준히 구매하고 있습니다. 10년을 넘게 퇴근 후 복권을 구매했는데, 급한 업무 일정 때문에 어쩔 수 없이 오전에 복권을 구매하게 되었습니다. 구매 후 번호를 확인해봤는데, 중복된 숫자가 보여서 ‘이래서 당첨되겠나?’라는 생각이 들었습니다. 추첨이 끝나고 며칠 뒤, 연금복권을 확인했는데 1·2등에 당첨되었습니다. 당첨 사실이 믿어지지 않았고, 실감이 나지 않아서인지 기쁨을 느끼지 못했습니다. 오히려 당첨금 수령을 위해 서울로 가는 길이 너무 떨리고 긴장되었습니다. 평소에 노후에 대한 걱정이 많아서 국민연금, 개인연금 등을 철저하게 준비해왔지만 부족함을 느끼고 있었는데, 연금복권 1·2등에 당첨되니 모든 걱정이 사라져서 너무 기쁩니다. 노후를 생각하면 안정적으로 당첨을 받을 수 있는 연금복권에 당첨돼서 감사한 마음입니다.',
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.6),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
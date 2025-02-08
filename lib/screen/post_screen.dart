import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../widget/popupmenubotton_widget.dart';

class PostScreen extends StatefulWidget {
  PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  late String uid;

  @override
  void initState() {
    super.initState();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
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
                      width: 80,
                      height: 80,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.grey.shade300),
                        image: DecorationImage(
                          image: AssetImage('assets/profile_dummy/profile_01.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Container(
                        width: 80,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 12),
                            Text(
                              '함께 분석해봐요',
                              style: Theme.of(context).textTheme.headlineLarge?.copyWith(fontWeight: FontWeight.w600,),
                            ),
                            SizedBox(height: 4),
                            Text(
                              '2024 .10 .02',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                          ],
                        ),
                      ),
                    ),
                    PopupmenubottonWidget(),
                  ],
                ),
                SizedBox(height: 20),
                Divider(
                  color: Colors.grey.shade300,
                  thickness: 1.0,
                ),
                SizedBox(height: 30),
                Text(
                  '이번주도 구매 완료.',
                  style: Theme.of(context)
                      .textTheme
                      .displaySmall
                      ?.copyWith(height: 1.6, fontWeight: FontWeight.w700),
                ),
                SizedBox(height: 20),
                Container(
                  width: MediaQuery.of(context).size.width * 1,
                  height: 300,
                  decoration: BoxDecoration(
                    border:
                        Border.all(width: 1, color: Colors.grey.shade300),
                  ),
                  child: Image(
                    image: AssetImage(
                        'assets/image_dummy/image_dummy_01.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    '복권을 구매하면 기분이 좋아져서 꾸준히 구매하고 있습니다. 10년을 넘게 퇴근 후 복권을 구매했는데, 급한 업무 일정 때문에 어쩔 수 없이 오전에 복권을 구매하게 되었습니다. 구매 후 번호를 확인해봤는데, 중복된 숫자가 보여서 ‘이래서 당첨되겠나?’라는 생각이 들었습니다. 추첨이 끝나고 며칠 뒤, 연금복권을 확인했는데 1·2등에 당첨되었습니다. 당첨 사실이 믿어지지 않았고, 실감이 나지 않아서인지 기쁨을 느끼지 못했습니다. 오히려 당첨금 수령을 위해 서울로 가는 길이 너무 떨리고 긴장되었습니다. 평소에 노후에 대한 걱정이 많아서 국민연금, 개인연금 등을 철저하게 준비해왔지만 부족함을 느끼고 있었는데, 연금복권 1·2등에 당첨되니 모든 걱정이 사라져서 너무 기쁩니다. 노후를 생각하면 안정적으로 당첨을 받을 수 있는 연금복권에 당첨돼서 감사한 마음입니다.',
                    style: Theme.of(context)
                        .textTheme
                        .headlineMedium
                        ?.copyWith(height: 1.6),
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

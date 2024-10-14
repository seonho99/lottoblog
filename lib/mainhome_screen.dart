import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'popupmenubotton_widget.dart';


class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Row(
                children: [
                  // Container(
                  //   width: 104,
                  //   height: 100,
                  //   decoration: const BoxDecoration(
                  //     image: DecorationImage(
                  //       image: AssetImage('assets/logo/lottoblog_150_80.jpeg'),
                  //       fit: BoxFit.cover,
                  //     ),
                  //   ),
                  // ),
                  // const Spacer(),
                  Container(
                    width: 59,
                    height: 59,
                    decoration: BoxDecoration(
                      image: const DecorationImage(
                        image:
                        AssetImage('assets/profile_dummy/profile_01.png'),
                        fit: BoxFit.cover,
                      ),
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 1,
                        color: Colors.grey.shade300,
                      ),
                    ),
                  ),
                  const SizedBox(width: 15),
                  Text('함께 분석해봐요 님',style: Theme.of(context).textTheme.headlineSmall),
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: GestureDetector(
            onTap: (){
              context.go('/mainhome_screen/blogpost_screen01');
            },
            child: Column(
              children: [
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 130,
                      decoration: BoxDecoration(
                        image: const DecorationImage(
                          image:
                          AssetImage('assets/image_dummy/image_dummy_01.png'),
                          fit: BoxFit.cover,
                        ),
                        border: Border.all(width: 1, color: Colors.grey.shade300),
                      ),
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
                                    '2024 10 02 로또 5,000원 샀습니다.',

                                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(height: 1.6),
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
                                  style: Theme.of(context).textTheme.titleMedium,
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
                    ),
                  ],
                ),
                const SizedBox(height: 10),
                Divider(color: Colors.grey.shade300, thickness: 1.0),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
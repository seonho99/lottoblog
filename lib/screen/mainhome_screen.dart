import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../widget/popupmenubotton_widget.dart';

class MainhomeScreen extends StatelessWidget {
  const MainhomeScreen({super.key});

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
                Padding(
                  padding: const EdgeInsets.only(bottom: 30),
                  child: Text('커뮤니티',
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.w800),
                  ),
                ),


                GestureDetector(
                  onTap: () {
                    context.go('/mainhome/post_screen');
                  },
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 130,
                          height: 130,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage(
                                  'assets/image_dummy/image_dummy_01.png'),
                              fit: BoxFit.cover,
                            ),
                            border: Border.all(
                                width: 1, color: Colors.grey.shade300),
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 40),
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.56,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text(
                                      '2024 로또 구매 구매했다 구매했다 구매했다 구마유시',
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall
                                          ?.copyWith(height: 1.6),
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  PopupmenubottonWidget(),
                                ],
                              ),
                            ),
                          ),
                          Icon(Icons.favorite_outline),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16),
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
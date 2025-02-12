import 'package:flutter/material.dart';
import 'package:lottoblog/screen/post_screen/post_screen_tile.dart';
import '../../widget/popupmenubotton_widget.dart';

class PostScreen extends StatelessWidget {
  PostScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        actions: [
          PopupmenubottonWidget(),
        ],
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Container(
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
                          border:
                          Border.all(width: 1, color: Colors.grey.shade300),
                          image: DecorationImage(
                            image: AssetImage(
                                'assets/profile_dummy/profile_01.png'),
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
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineLarge
                                    ?.copyWith(
                                  fontWeight: FontWeight.w600,
                                ),
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
                 // PostScreenTile(postId: postId, title: title, content: content, imageUrls: imageUrls)
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
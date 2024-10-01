import 'package:flutter/material.dart';

class BlogPostScreen extends StatelessWidget {
  const BlogPostScreen({super.key});

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
                      width: 48,
                      height: 48,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(width: 1, color: Colors.grey[300]!),
                        // image: DecorationImage(
                        //   image: NetworkImage('https://picsum.photos/200'),
                        //   fit: BoxFit.cover,
                        // ),
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '닉네임',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          '24.10.01',
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.grey[600],
                          ),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Icon(Icons.more_vert,size: 30),
                  ],
                ),
                SizedBox(height: 24),
                Text(
                  '제목',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 16),
                Text(
                  '커피 한잔 할래요?',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '글',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 24),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      SizedBox(width: 10),
                      Container(
                        width: 160,
                        height: 200,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[300]!),
                          borderRadius: BorderRadius.circular(8),
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

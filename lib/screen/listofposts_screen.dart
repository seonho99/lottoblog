import 'package:flutter/material.dart';

class ListofpostsScreen extends StatelessWidget {
  const ListofpostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('글 목록',
            style: Theme.of(context)
                .textTheme
                .headlineSmall
                ?.copyWith(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '10월',
                style: Theme.of(context)
                    .textTheme
                    .headlineMedium
                    ?.copyWith(fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                    border: Border.all(width: 1,color: Colors.grey.shade300),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Container(
                        width: 80,
                        height: 110,
                        decoration: BoxDecoration(
                          border: Border.all(width: 1, color: Colors.grey[300]!),
                        ),
                        child: const Image(
                          image:
                          AssetImage('assets/image_dummy/image_dummy_01.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No 1.',
                              style:
                              Theme.of(context).textTheme.titleSmall != null
                                  ? Theme.of(context)
                                  .textTheme
                                  .titleSmall!
                                  .copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary)
                                  : TextStyle(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .secondary)),
                          SizedBox(height: 4),
                          Text(
                            '2024 10 02 로또 5,000원 샀습니다.',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('24. 10. 02.',
                                  style: Theme.of(context).textTheme.titleSmall),
                              SizedBox(height: 4),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Icon(
                                    Icons.favorite_outline,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text('1,000,000',
                                      style:
                                      Theme.of(context).textTheme.titleSmall),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Divider(height: 1,color: Colors.grey.shade300),
            ],
          ),
        ),
      ),
    );
  }
}
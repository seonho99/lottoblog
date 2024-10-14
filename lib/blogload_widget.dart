
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const TextStyle headlineMediumBold = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

class BlogLoadWidget extends StatelessWidget {
  BlogLoadWidget({super.key});


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 130,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/image_dummy'),
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
                        Expanded(
                          child: Text(
                            '',
                            style: headlineMediumBold,
                          ),
                        ),
                        const Icon(Icons.more_vert, size: 30),
                      ],
                    ),
                    Row(
                      children: [
                        Text(
                          '',
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        const Spacer(),
                        Row(
                          children: const [
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
    );
  }
}
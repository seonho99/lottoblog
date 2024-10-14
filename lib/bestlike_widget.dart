import 'package:flutter/material.dart';

const TextStyle headlineMediumBold = TextStyle(
  fontSize: 22,
  fontWeight: FontWeight.bold,
);

class BestLikeWidget extends StatelessWidget {
  const BestLikeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          width: 210,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 35,
                height: 35,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 1, color: Colors.grey),
                  image: DecorationImage(
                    image: AssetImage('assets/profile_dummy/profile_01.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Text(
                '',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const Spacer(),
              const Icon(Icons.more_vert, size: 25),
            ],
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 210,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey.shade200, width: 1.0),
            image: DecorationImage(
              image: AssetImage('assets/image_dummy/image_dummy_01.png'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const SizedBox(height: 10),
        Container(
          width: 210,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                child: Text(
                  '',
                  style: headlineMediumBold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Icon(Icons.favorite),
              const SizedBox(width: 5),
              Text('100', style: Theme.of(context).textTheme.titleLarge),
            ],
          ),
        ),
      ],
    );
  }
}

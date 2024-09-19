import 'package:flutter/material.dart';
import 'bestauthor_week.dart';
import 'author_day.dart';

class MainhomePage extends StatelessWidget {
  const MainhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        'Lotto Blog',
                        style:
                            TextStyle(fontSize: 27, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.yellow,
                      ),
                    ),
                  ],
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  height: 60,
                  margin: EdgeInsets.only(bottom: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: List.generate(
                      6,
                      (index) => Expanded(
                        child: CircleAvatar(
                          radius: 23,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          child: CircleAvatar(
                            radius: 22,
                            backgroundColor: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        BestAuthorWeek(),
                        BestAuthorWeek(),
                        BestAuthorWeek(),
                        BestAuthorWeek(),
                        BestAuthorWeek(),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(bottom: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '월',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '화',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '수',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '목',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '금',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '토',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                          Text(
                            '일',
                            style: Theme.of(context).textTheme.headlineSmall,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                author_day(),
                author_day(),
                author_day(),
                author_day(),
                author_day(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}


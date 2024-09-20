import 'package:flutter/material.dart';

class BestAuthorWeek extends StatelessWidget {
  const BestAuthorWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 10, left: 10),
            width: 300,
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.grey.shade500,
            ),
          ),
          Column(
            children: [
              Container(
                margin: EdgeInsets.only(left: 10, bottom: 10),
                width: 300,
                height: 80,
                decoration: BoxDecoration(
                  color: Colors.yellow,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '제목',
                        style: TextStyle(
                            fontSize: 24, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Text(
                        '아이디',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],

    );
  }
}

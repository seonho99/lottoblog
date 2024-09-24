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
          margin: EdgeInsets.only(left: 10),
          width: 300,
          height: 250,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey, width: 1.0),
          ),
        ),
        Column(
          children: [
            Container(
              margin: EdgeInsets.only(left: 10),
              width: 300,
              height: 80,
              decoration: BoxDecoration(
                // border: Border(
                //   bottom: BorderSide(color: Colors.grey, width: 1.0),
                //   left: BorderSide(color: Colors.grey, width: 1.0),
                //   right: BorderSide(color: Colors.grey, width: 1.0),
                // ),
              ),
              child: Container(margin: EdgeInsets.all(8),
                child: Row(
                  children: [
                    CircleAvatar(radius: 30),
                    Expanded(
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                '제목',
                                style:
                                    TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

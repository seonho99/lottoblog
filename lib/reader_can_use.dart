import 'package:flutter/material.dart';

class ReaderCanUse extends StatelessWidget {
  const ReaderCanUse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              // margin: EdgeInsxets.only(bottom: 30),
              width: 100,
              height: 100,
              color: Colors.yellow,
            ),
            SizedBox(width: 16),
            Expanded(
              child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Align(
                      alignment: Alignment.topLeft,
                      child: Text(
                        '제목',
                        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
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
        ),Container(
          child: Divider(color: Colors.grey, thickness: 1.0),
          padding: EdgeInsets.only(top: 15, bottom: 15),
        ),
      ],
    );
  }
}

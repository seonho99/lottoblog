import 'package:flutter/material.dart';
class BestAuthorWeek extends StatelessWidget {
  const BestAuthorWeek({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 200,
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color: Colors.grey.shade500,
      ),
    );
  }
}

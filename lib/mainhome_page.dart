import 'package:flutter/material.dart';
import 'bestauthor_week.dart';
import 'reader_can_use.dart';

class MainhomePage extends StatelessWidget {
  const MainhomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        title: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 80,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ],
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(1.0),
          child: Container(
            color: Colors.grey,
            height: 1.0,
          ),
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                SizedBox(height: 10),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
                ReaderCanUse(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

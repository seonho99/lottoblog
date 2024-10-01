import 'package:flutter/material.dart';
import 'bestlike_widget.dart';
import 'blogload_widget.dart';

class MainHomeScreen extends StatelessWidget {
  const MainHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.white,
        elevation: 0,
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 150,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.grey),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Divider(height: 1, color: Colors.grey),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                SizedBox(height: 10),
                BlogLoadWidget(),
                BlogLoadWidget(),
                BlogLoadWidget(),
                BlogLoadWidget(),
                BlogLoadWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

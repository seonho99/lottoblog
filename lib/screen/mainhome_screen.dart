import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../widget/popupmenubotton_widget.dart';

class MainHomeScreen extends StatelessWidget {
  MainHomeScreen({super.key});


  List<Widget> getHomeList(BuildContext context) {
    List<Widget> homeList = [];
    for (var i = 0; i < mainhomes.length; i++) {
      var image = mainhomes[i].postImage;
      var title = mainhomes[i].postTitle;
      var name = mainhomes[i].postName;
      homeList.add(
        Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    Container(
                      width: 100,
                      height: 130,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/image_dummy/$image'),
                          fit: BoxFit.cover,
                        ),
                        border:
                            Border.all(width: 1, color: Colors.grey.shade300),
                      ),
                    ),
                  ],
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
                            SizedBox(
                              width: 185,
                              child: Text(
                                '$title',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(height: 1.6),
                              ),
                            ),
                            const Spacer(),
                            Expanded(child: PopupmenubottonWidget()),
                            // Icon(Icons.more_vert, size: 30),
                          ],
                        ),
                        Row(
                          children: [
                            Text(
                              '$name',
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            Spacer(),
                            Row(
                              children: [
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
            SizedBox(height: 10),
            Divider(color: Colors.grey.shade300, thickness: 1.0),
            SizedBox(height: 15),
          ],
        ),
      );
    }
    if (homeList.isNotEmpty) {
      (homeList.last as Column).children.removeLast();
      (homeList.last as Column).children.removeLast();
    }
    return homeList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        title: Text('최신글',
            style: Theme.of(context)
                .textTheme
                .headlineMedium
                ?.copyWith(fontWeight: FontWeight.bold)),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () {
                context.go('/mainhome/post_screen01',
                extra: '1');
              },
              child: Column(
                children: getHomeList(context),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

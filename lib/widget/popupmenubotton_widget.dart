import 'package:flutter/material.dart';

enum SampleItem { itemOne, itemTwo }

class PopupmenubottonWidget extends StatefulWidget {
  const PopupmenubottonWidget({super.key});

  @override
  State<PopupmenubottonWidget> createState() => _PopupmenubottonWidgetState();
}

class _PopupmenubottonWidgetState extends State<PopupmenubottonWidget> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      icon: const Column(
        children: [
          Icon(Icons.circle, size: 6),
          Icon(Icons.circle, size: 6),
          Icon(Icons.circle, size: 6),
        ],
      ),
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(
              () {
            selectedItem = item;
          },
        );
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: Text('신고하기',
            style: TextStyle(color: Colors.black),),
        ),
        const PopupMenuItem<SampleItem>(
          value: SampleItem.itemTwo,
          child: Text('차단하기',
            style: TextStyle(color: Colors.black),),
        ),
      ],
    );
  }
}
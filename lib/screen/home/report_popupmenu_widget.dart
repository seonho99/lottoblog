import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/report/report_event.dart';

import '../../data/bloc/report/report_bloc.dart';

enum SampleItem { itemOne, itemTwo }

class ReportPopMenuWidget extends StatefulWidget {
  final String postId; // postId to report

  ReportPopMenuWidget({super.key, required this.postId});

  @override
  State<ReportPopMenuWidget> createState() => _ReportPopMenuWidgetState();
}

class _ReportPopMenuWidgetState extends State<ReportPopMenuWidget> {
  SampleItem? selectedItem;

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<SampleItem>(
      color: Colors.white,
      icon: Column(
        children: [
          Icon(Icons.circle, size: 6),
          Icon(Icons.circle, size: 6),
          Icon(Icons.circle, size: 6),
        ],
      ),
      initialValue: selectedItem,
      onSelected: (SampleItem item) {
        setState(() {
          selectedItem = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<SampleItem>>[
        PopupMenuItem<SampleItem>(
          value: SampleItem.itemOne,
          child: TextButton(
            onPressed: () {
              context.read<ReportBloc>().add(ReportPostEvent(postId: widget.postId));

              Navigator.of(context).pop();
            },
            child: Text(
              '신고하기',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }
}
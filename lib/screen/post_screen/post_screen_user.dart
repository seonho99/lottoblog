import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


import '../../data/bloc/profile/profile_bloc.dart';
import '../../data/bloc/profile/profile_event.dart';
import '../../widget/popupmenubotton_widget.dart';

class PostScreenUser extends StatefulWidget {
  String userName;
  String profileImageUrl;


  PostScreenUser({
    super.key,
    required this.userName,
    required this.profileImageUrl,
  });

  @override
  State<PostScreenUser> createState() => _PostScreenUserState();
}

class _PostScreenUserState extends State<PostScreenUser> {
  @override
  void initState() {
    super.initState();
    // context.read<PostScreenBloc>().add(FetchTime(createdAt: widget.createdAt));
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          width: 80,
          height: 80,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width: 1, color: Colors.grey.shade300),
            image: DecorationImage(
              image: AssetImage(widget.profileImageUrl),
              fit: BoxFit.cover,
            ),
          ),
        ),
        SizedBox(width: 16),
        Expanded(
          child: Container(
            width: 80,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 12),
                Text(
                  widget.userName,
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
                SizedBox(height: 4),
                // Text(
                  // widget.createdAt,
                  // style: Theme.of(context).textTheme.titleMedium,
                // ),
              ],
            ),
          ),
        ),
        PopupmenubottonWidget(),
      ],
    );
  }
}

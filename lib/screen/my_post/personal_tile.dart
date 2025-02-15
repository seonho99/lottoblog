import 'package:flutter/material.dart';

class PersonalTile extends StatefulWidget {
  String userName;
  String profileImageUrl;
  PersonalTile({super.key, required this.profileImageUrl, required this.userName});

  @override
  State<PersonalTile> createState() => _PersonalTileState();
}

class _PersonalTileState extends State<PersonalTile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircleAvatar(
          radius: 45,
          backgroundImage: (widget.profileImageUrl == null ||
              widget.profileImageUrl.isEmpty)
              ? const AssetImage(
              'assets/profile_dummy/profile_01.png')
              : NetworkImage(widget.profileImageUrl)
          as ImageProvider,
        ),
        SizedBox(width: 16),
        Expanded(
          child: Text(
            widget.userName,
            style: Theme.of(context)
                .textTheme
                .displaySmall
                ?.copyWith(fontWeight: FontWeight.w800),
          ),
        ),
      ],
    );
  }
}

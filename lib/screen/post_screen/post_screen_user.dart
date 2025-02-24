import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/post_user/post_user_event.dart';
import 'package:lottoblog/data/bloc/post_user/post_user_state.dart';

import '../../data/bloc/post_user/post_user_bloc.dart';

class PostScreenUser extends StatefulWidget {
  String uid;
  // String userName;
  // String profileImageUrl;

  PostScreenUser({
    super.key,
    required this.uid,
    // required this.userName,
    // required this.profileImageUrl,
  });

  @override
  State<PostScreenUser> createState() => _PostScreenUserState();
}

class _PostScreenUserState extends State<PostScreenUser> {
  late String userName;
  late String profileImageUrl;

  @override
  void initState() {
    super.initState();
    print('uid: ${widget.uid}');
    context.read<PostUserBloc>().add(UpdateUserEvent(uid: widget.uid));
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostUserBloc, PostUserState>(
      builder: (context, state) {
        print('state: $state');
        if (state is PostUserInitial) {
          return Container();
        } else if (state is PostUserUpdated) {
          return Container(
            child: Row(
              children: [
                Container(
                  width: 80,
                  height: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(width: 1, color: Colors.grey.shade300),
                    image: DecorationImage(
                      image: NetworkImage(state.user!.profileImageUrl!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Container(
                    width: 80,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 12),
                        Text(
                          state.user?.userName??'',
                          style:
                              Theme.of(context).textTheme.headlineLarge?.copyWith(
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
              ],
            ),
          );
        } else if (state is PostUserFailure) {
          return Center(
            child: Text('실패: ${state.errorMessage}'),
          );
        }
        return Center(
          child: Text('데이터 불러오기 실패'),
        );
      },
    );
  }
}

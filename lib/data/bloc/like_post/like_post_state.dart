import 'package:lottoblog/models/post_model.dart';

sealed class LikePostState{
  final List<PostModel> likePosts;

  LikePostState({required this.likePosts});
}

final class LikePostsInitial extends LikePostState{
  LikePostsInitial() : super(likePosts: []);
}

final class LikePostsSuccess extends LikePostState{

  LikePostsSuccess(List<PostModel> likePosts) : super(likePosts: likePosts);
}

final class LikePostsFailure extends LikePostState {
  final String errorMessage;

  LikePostsFailure({required this.errorMessage}) : super(likePosts: []);
}

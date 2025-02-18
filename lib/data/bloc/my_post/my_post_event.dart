sealed class MyPostEvent {}

final class FetchMyPostsEvent extends MyPostEvent {}

final class MyLikeCountEvent extends MyPostEvent{
  final int likePostCount;
  final String postId;

  MyLikeCountEvent({required this.likePostCount,required this.postId});
}


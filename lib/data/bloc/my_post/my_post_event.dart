sealed class MyPostEvent {}

final class FetchMyPostsEvent extends MyPostEvent {}

final class MyLikeCountEvent extends MyPostEvent{
  final int likeCount;
  final String postId;

  MyLikeCountEvent({required this.likeCount,required this.postId});
}


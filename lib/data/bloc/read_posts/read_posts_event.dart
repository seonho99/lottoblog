sealed class ReadPostsEvent {}

final class FetchAllPostsEvent extends ReadPostsEvent {}

// blocSelecter 개발하는 남자 bloc 4편 좋아요
final class LikePostEvent extends ReadPostsEvent {
 final bool isLiked;
 final int likeCount;
 final String postId;

  LikePostEvent({
    required this.isLiked,
    required this.likeCount,
    required this.postId,
  });
}

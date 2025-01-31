sealed class ReadPostsEvent {}

final class FetchAllPostsEvent extends ReadPostsEvent {}

// blocSelecter 개발하는 남자 bloc 4편 좋아요
final class LikePostEvent extends ReadPostsEvent {
  final String postId;
  final List<String> likePostUid;
  final String uid;
  final List<String> userLikePost;

  LikePostEvent({
    required this.postId,
    required this.likePostUid,
    required this.uid,
    required this.userLikePost,
  });
}

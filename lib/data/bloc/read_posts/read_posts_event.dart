sealed class ReadPostsEvent{}

final class FetchAllPostsEvent extends ReadPostsEvent{}

// blocSelecter 개발하는 남자 bloc 4편 좋아요
final class LikePostEvent extends ReadPostsEvent {
  final String? postId;
  final String? uid;
  final List<String>? likePostUid;
  final bool? isLiked;

  LikePostEvent(this.postId, this.uid, this.likePostUid, this.isLiked);
}
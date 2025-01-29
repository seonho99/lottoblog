sealed class ReadPostsEvent{}

final class FetchAllPostsEvent extends ReadPostsEvent{}

// blocSelecter 개발하는 남자 bloc 4편 좋아요
final class LikePostEvent extends ReadPostsEvent {
  final String? postId;
  final String? uid;

  LikePostEvent({required this.postId,required this.uid});
}
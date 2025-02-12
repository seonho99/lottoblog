sealed class PostScreenEvent {}

final class FetchPost extends PostScreenEvent {
  String postId;
  String title;
  String content;
  List<String> imageUrls;

  FetchPost({
    required this.postId,
    required this.title,
    required this.content,
    required this.imageUrls,
  });
}
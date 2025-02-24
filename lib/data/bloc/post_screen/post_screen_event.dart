sealed class PostScreenEvent {}

final class FetchPostEvent extends PostScreenEvent {
  String postId;
  // String title;
  // String content;
  // List<String> imageUrls;

  FetchPostEvent({
    required this.postId,
    // required this.title,
    // required this.content,
    // required this.imageUrls,
  });
}

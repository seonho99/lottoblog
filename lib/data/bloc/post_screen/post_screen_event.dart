sealed class PostScreenEvent {}

final class FetchPostEvent extends PostScreenEvent {
  String postId;

  FetchPostEvent({required this.postId});
}

final class UpdatePostEvent extends PostScreenEvent {
  String postId;
  String title;
  String content;
  List<String> images;

  UpdatePostEvent(this.postId, this.title, this.content, this.images);
}

sealed class PostScreenEvent {}

final class FetchPostEvent extends PostScreenEvent {
  String postId;

  FetchPostEvent({required this.postId});
}

final class UpdatePostEvent extends PostScreenEvent {
  String postId;

  UpdatePostEvent({required this.postId});
}

final class DeleteImageUrlEvent extends PostScreenEvent {
  String postId;
  String imageUrls;

  DeleteImageUrlEvent({required this.postId, required this.imageUrls});
}
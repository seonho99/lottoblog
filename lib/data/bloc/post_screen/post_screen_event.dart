import 'package:lottoblog/models/post_model.dart';

sealed class PostScreenEvent {}

final class FetchPostEvent extends PostScreenEvent {
  String postId;

  FetchPostEvent({required this.postId});
}

final class UpdatePostEvent extends PostScreenEvent {
  PostModel updatePost;

  UpdatePostEvent({required this.updatePost});
}

final class DeleteImageUrlEvent extends PostScreenEvent {
  String postId;
  String imageUrls;

  DeleteImageUrlEvent({required this.postId, required this.imageUrls});
}
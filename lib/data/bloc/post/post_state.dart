
import '../../../models/post_model.dart';

sealed class PostState {
  final List<PostModel> postmodel;

  PostState({required this.postmodel});
}

// 초기 상태
final class PostInitial extends PostState {
  PostInitial() : super(postmodel: []);
}

// 로딩 상태
final class PostLoading extends PostState {
  PostLoading() : super(postmodel: []);
}

// 게시글 갱신 상태
final class PostLoaded extends PostState {
  PostLoaded(List<PostModel> postmodel) : super(postmodel: postmodel);
}


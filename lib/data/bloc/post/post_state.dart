import '../../../models/post_model.dart';

sealed class PostState {
  final List<PostModel> postModel;
  PostState({required this.postModel});
}

// 초기
final class PostInitialState extends PostState {
  PostInitialState(): super(postModel:[]);
}


final class PostLoading extends PostState {
  PostLoading() : super(postModel: []);
}

// 갱신
final class PostLoaded extends PostState{
  PostLoaded({required List<PostModel> postModel}) : super (postModel: postModel);
}


final class PostError extends PostState {
  final String message;
  PostError({required this.message}) : super(postModel: []);
}
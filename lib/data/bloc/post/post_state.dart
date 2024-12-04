import '../../../models/post_model.dart';

sealed class PostState {
  final List<PostModel> postModel;
  PostState({required this.postModel});
}

// 초기
final class PostInitialState extends PostState {
  PostInitialState(): super(postModel:[]);
}


// 갱신
final class PostLoaded extends PostState{
  PostLoaded(List<PostModel> postModel) : super (postModel: postModel);
}



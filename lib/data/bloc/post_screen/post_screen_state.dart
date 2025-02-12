import '../../../models/post_model.dart';

sealed class PostScreenState{
  final List<PostModel> selectedPost;

  PostScreenState({required this.selectedPost});

}

final class PostScreenInitial extends PostScreenState{
  PostScreenInitial() : super(selectedPost:[]);
}

final class PostScreenSuccess extends PostScreenState{
  PostScreenSuccess(List<PostModel> selectedPost) : super(selectedPost: selectedPost);
}


final class PostScreenFailure extends PostScreenState{
  String errorMessage;

  PostScreenFailure({required this.errorMessage}) : super(selectedPost: []);
}
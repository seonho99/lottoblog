import '../../../models/post_model.dart';

sealed class PostScreenState{
  PostModel? fetchPostScreen;

  PostScreenState({required this.fetchPostScreen});
}

final class PostScreenInitial extends PostScreenState{
  PostScreenInitial() : super(fetchPostScreen: null);
}

final class PostScreenSuccess extends PostScreenState{
  PostScreenSuccess(PostModel? fetchPostScreen) : super(fetchPostScreen: fetchPostScreen);
}


final class PostScreenFailure extends PostScreenState{
  String errorMessage;

  PostScreenFailure({required this.errorMessage}) : super(fetchPostScreen: null);
}
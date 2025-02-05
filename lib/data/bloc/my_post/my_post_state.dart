import '../../../models/post_model.dart';

sealed class MyPostState {
  final List<PostModel> myPosts;

  MyPostState({required this.myPosts});

// @override
// String toString() {
//   return 'PostState(myPosts: ${myPosts.length}, openPosts: ${openPosts.length}';
// }
}

// 초기 상태
final class MyPostInitial extends MyPostState {
  MyPostInitial() : super(myPosts: []);

// @override
// String toString() {
//   return 'PostInitial(myPosts: ${myPosts.length}';
// }
}


// 게시글 갱신 상태
final class MyPostSuccess extends MyPostState {
  MyPostSuccess(List<PostModel> myPosts) : super(myPosts: myPosts);

// @override
// String toString() {
//   return 'PostsLoaded(myPosts: ${myPosts.map((post) => post.toMap()).toList()}, openPosts: ${openPosts.map((post) => post.toMap()).toList()})';
// }
}

// 에러 상태
final class MyPostFailure extends MyPostState {
  final String errorMessage;

  MyPostFailure({required this.errorMessage}) : super (myPosts: []);
}

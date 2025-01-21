import '../../../models/post_model.dart';

// sealed class PostState {
//   final List<PostModel> posts;
//
//   PostState({required this.posts});
// }
//
// // 초기 상태
// final class PostInitial extends PostState {
//   PostInitial() : super(posts: []);
// }
//
// // 로딩 상태
// final class PostLoading extends PostState {
//   PostLoading() : super(posts: []);
// }
//
// // 게시글 갱신 상태
// final class PostLoaded extends PostState {
//   PostLoaded(List<PostModel> posts) : super(posts: posts);
// }
//
// final class PostFailure extends PostState {
//   final String errorMessage;
//
//   PostFailure({required this.errorMessage}) : super(posts: []);
// }

sealed class PostState {
  final List<PostModel> myPosts;

  PostState({required this.myPosts});

  // @override
  // String toString() {
  //   return 'PostState(myPosts: ${myPosts.length}, openPosts: ${openPosts.length}';
  // }
}

// 초기 상태
final class PostInitial extends PostState {
  PostInitial() : super(myPosts: []);

  // @override
  // String toString() {
  //   return 'PostInitial(myPosts: ${myPosts.length}';
  // }
}

// 사용자 게시글 상태
final class MyPosts extends PostState {
  MyPosts(List<PostModel> myPosts) : super(myPosts: myPosts);

  // @override
  // String toString() {
  //   return 'MyPosts(myPosts: ${myPosts.map((post) => post.toMap()).toList()})';
  // }
}


// 게시글 갱신 상태
final class PostsLoaded extends PostState {
  PostsLoaded(List<PostModel> myPosts) : super(myPosts: myPosts);

  // @override
  // String toString() {
  //   return 'PostsLoaded(myPosts: ${myPosts.map((post) => post.toMap()).toList()}, openPosts: ${openPosts.map((post) => post.toMap()).toList()})';
  // }
}

// 에러 상태
final class PostFailure extends PostState {
  final String errorMessage;

  PostFailure({required this.errorMessage}) : super (myPosts: []);
}

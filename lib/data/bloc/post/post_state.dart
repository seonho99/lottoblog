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
  final List<PostModel> openPosts;

  PostState({required this.myPosts, required this.openPosts});
}

// 초기 상태
final class PostInitial extends PostState {
  PostInitial() : super(myPosts: [], openPosts: []);
}

// 사용자 게시글 상태
final class MyPosts extends PostState {
  MyPosts(List<PostModel> myPosts
      // ,List<PostModel> openPosts
      ) : super(myPosts: myPosts, openPosts: []);
}

// 공개 게시글 상태
final class OpenPosts extends PostState {
  OpenPosts(List<PostModel> openPosts)
      : super(myPosts: [], openPosts: openPosts);
}

// 게시글 갱신 상태
final class PostsLoaded extends PostState {
  PostsLoaded(List<PostModel> myPosts, List<PostModel> openPosts) : super(myPosts: myPosts, openPosts: openPosts);
}

// 에러 상태
final class PostFailure extends PostState {
  final String errorMessage;

  PostFailure({required this.errorMessage}) : super(myPosts: [], openPosts: []);
}

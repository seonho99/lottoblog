import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../../../models/post_model.dart';
import '../../repository/post_repository.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final PostRepository _postRepository;

  PostBloc(this._postRepository) : super(PostInitialState()) {
    // 게시글 수정
    on<PostContentChangedEvent>((event, emit) {
      emit(PostContentChangedState(
        title: event.title,
        content: event.content,
        imageUrls: event.imageUrls,
      ));
    });

    // 게시글 제출
    on<PostSubmittedEvent>((event, emit) async {
      try {
        final userId = await _postRepository.getUserId();

        if (userId.isEmpty) {
          emit(PostErrorState('사용자가 로그인되지 않았습니다.'));
          return;
        }

        List<String> imageUrls = await uploadImages(event.postModel.imageUrls);

        final postModel = PostModel(
          title: event.postModel.title,
          content: event.postModel.content,
          uid: userId,
          imageUrls: imageUrls,
          createdAt: DateTime.now(),
        );

        await _postRepository.createPost(postModel);

        emit(PostSubmittedState(postModel)); // 성공 상태로 변경
      } catch (e) {
        emit(PostErrorState('게시글 제출에 실패했습니다.'));
      }
    });

    // 게시글 수정
    on<PostUpdateEvent>((event, emit) async {
      try {
        final userId = await _postRepository.getUserId();

        if (userId.isEmpty) {
          emit(PostErrorState('사용자가 로그인되지 않았습니다.'));
          return;
        }

        // 게시글 수정 처리
        await _postRepository.updatePost(event.postModel);
        emit(PostUpdatedState(event.postModel));
      } catch (e) {
        emit(PostErrorState('게시글 수정에 실패했습니다.'));
      }
    });

    on<PostGetAllPostsEvent>((event, emit) async {
      try {
        emit(PostLoadingState());
        final posts = await _postRepository.getPostsUser(event.uid);
        emit(PostLoadedState(posts));
      } catch (e) {
        emit(PostErrorState('게시글을 불러오는데 실패했습니다.'));
      }
    });
  }
}

Future<List<String>> uploadImages(List<String> imagePaths) async {
  List<String> imageUrls = [];
  final FirebaseStorage storage = FirebaseStorage.instance;

  for (var imagePath in imagePaths) {
    try {
      final file = File(imagePath);
      final fileName = DateTime.now().millisecondsSinceEpoch.toString();
      final storageRef = storage.ref().child('images/$fileName');
      await storageRef.putFile(file);

      final downloadUrl = await storageRef.getDownloadURL();
      imageUrls.add(downloadUrl);
    } catch (e) {
      print('이미지 업로드 실패: $e');
      throw Exception('이미지 업로드에 실패했습니다: $e');
    }
  }
  return imageUrls;
}

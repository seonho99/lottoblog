import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:lottoblog/data/bloc/report/report_event.dart';
import 'package:lottoblog/data/bloc/report/report_state.dart';
import 'package:lottoblog/data/repository/post_repository.dart';

class ReportBloc extends Bloc<ReportEvent,ReportState>{
  final PostRepository postRepository;

  ReportBloc(this.postRepository) : super(ReportInitial()){
    on<ReportPostEvent>((event, emit) async {
      try{
        await postRepository.reportPost(event.postId);
        final updatedPosts = await postRepository.fetchSafePosts();
        emit(ReportSuccess(updatedPosts));
      }catch(e){

        emit(ReportFailure(errorMassage: e.toString()));
      }
    });
  }
}




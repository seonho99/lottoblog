import 'package:lottoblog/models/post_model.dart';

sealed class ReportState {
  final List<PostModel> reportPost;

  ReportState({required this.reportPost});
}

final class ReportInitial extends ReportState {
  ReportInitial() : super(reportPost: []);
}

final class ReportSuccess extends ReportState {

  ReportSuccess(List<PostModel> reportPost) : super(reportPost: reportPost);
}

final class ReportFailure extends ReportState {
  final String errorMassage;

  ReportFailure({required this.errorMassage}) : super(reportPost: []);
}



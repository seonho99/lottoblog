sealed class ReportEvent {}

final class ReportPostEvent extends ReportEvent{
  // String uid;
  String postId;

  ReportPostEvent({
    // required this.uid,
    required this.postId,
  });
}



sealed class PostUserEvent {}

final class UpdateUserEvent extends PostUserEvent {
  String uid;

  UpdateUserEvent({
    required this.uid,
  });
}

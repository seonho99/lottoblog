sealed class ProfileEvent{}

final class UpdateProfileEvent extends ProfileEvent {
  String uid;

  UpdateProfileEvent({required this.uid,
  });
}


sealed class ProfileEvent{}

final class UpdateProfileEvent extends ProfileEvent {
  String uid;
  // String? userName;
  // String profileImageUrl;


  UpdateProfileEvent({required this.uid,
    // required this.userName,required this.profileImageUrl
  });
}

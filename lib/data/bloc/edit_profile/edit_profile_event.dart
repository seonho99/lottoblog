sealed class EditProfileEvent{}

final class UpdateEditProfileEvent extends EditProfileEvent {
  String name;
  String? profileImageURL;

  UpdateEditProfileEvent({required this.name,this.profileImageURL});
}




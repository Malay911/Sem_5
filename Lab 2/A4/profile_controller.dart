import 'utils/import_export.dart';

class ProfileController {
  List<ProfileModel> getAllProfiles() {
    return ProfileModel.getAllProfiles();
  }

  ProfileModel getProfile() {
    return ProfileModel.getProfileData();
  }
}

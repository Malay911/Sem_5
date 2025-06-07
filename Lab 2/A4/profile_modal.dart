//WAP to create a profile card with available widgets in Flutter.

class ProfileModel {
  final String name;
  final String email;
  final String profession;
  final String avatarPath;

  ProfileModel({
    required this.name,
    required this.email,
    required this.profession,
    required this.avatarPath,
  });

  static List<ProfileModel> getAllProfiles() {
    return [
      ProfileModel(
        name: 'Malay Panara',
        email: 'mp@gmail.com',
        profession: 'Software Engineer',
        avatarPath: 'assets/images/avatar_male.png',
      ),
      ProfileModel(
        name: 'Jane Smith',
        email: 'jane@gmail.com',
        profession: 'UI/UX Designer',
        avatarPath: 'assets/images/avatar_male.png',
      ),
    ];
  }

  static ProfileModel getProfileData() {
    return getAllProfiles()[0];
  }
}
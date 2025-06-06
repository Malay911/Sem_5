import 'utils/import_export.dart';

class SignupController {
  final SignupModal _model = SignupModal();

  void addUser(String name, String email, String phoneNumber,
      String password, String confirmPassword) {
    _model.addSignupDetails(name, email, phoneNumber, password, confirmPassword);
  }

  List<Map<String, dynamic>> getUsers() {
    return _model.getSignupDetails();
  }
}
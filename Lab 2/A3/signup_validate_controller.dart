import 'utils/import_export.dart';

class SignupController {
  final SignupModal _model = SignupModal();

  String? validateName(String? value) => _model.validateName(value);
  String? validateEmail(String? value) => _model.validateEmail(value);
  String? validatePhone(String? value) => _model.validatePhone(value);
  String? validatePassword(String? value) => _model.validatePassword(value);
  String? validateConfirmPassword(String? password, String? confirmPassword) =>
      _model.validateConfirmPassword(password, confirmPassword);

  void addUser(String name, String email, String phoneNumber, String password,
      String confirmPassword) {
    _model.addSignupDetails(
        name, email, phoneNumber, password, confirmPassword);
  }

  List<Map<String, dynamic>> getUsers() {
    return _model.getSignupDetails();
  }
}

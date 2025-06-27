import 'utils/import_export.dart';

class RxStringController extends GetxController {
  final RxStringModal _modal = RxStringModal();

  RxString get text => _modal.text;

  void updateText(String newText) {
    _modal.updateText(newText);
  }

  void clearText() {
    _modal.updateText('');
  }
}

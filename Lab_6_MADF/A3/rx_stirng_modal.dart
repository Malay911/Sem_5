// WAP to bind a TextField to a RxString and reflect real-time changes.

import 'utils/import_export.dart';

class RxStringModal {
  RxString text = ''.obs;

  void updateText(String newText) {
    text.value = newText;
  }
}

import 'utils/import_export.dart';

class CrudController extends GetxController {
  final CrudRxlistModal _model = CrudRxlistModal();

  RxList<Map<String, dynamic>> get items => _model.items;

  void addItem(String title, String description) {
    _model.addItem(title, description);
  }

  void updateItem(int index, String title, String description) {
    _model.updateItem(index, title, description);
  }

  void deleteItem(int index) {
    _model.deleteItem(index);
  }
}

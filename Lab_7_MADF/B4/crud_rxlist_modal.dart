// WAP to do CRUD operation using RXList<dynamic> (RXList<Map>).
import 'utils/import_export.dart';

class CrudRxlistModal {
  final items = <Map<String, dynamic>>[].obs;

  void addItem(String title, String description) {
    items.add({
      'title': title,
      'description': description,
      'timestamp': DateTime.now().toString()
    });
  }

  void deleteItem(int index) {
    items.removeAt(index);
  }

  void updateItem(int index, String title, String description) {
    items[index] = {
      'title': title,
      'description': description,
      'timestamp': DateTime.now().toString()
    };
    items.refresh();
  }
}
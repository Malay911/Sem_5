import 'utils/import_export.dart';

class ListController extends GetxController {
  final items = <ListItem>[].obs;

  void addItem(String title, String description) {
    items.add(ListItem(
      title: title,
      description: description,
    ));
  }

  void deleteItem(int index) {
    items.removeAt(index);
  }
}
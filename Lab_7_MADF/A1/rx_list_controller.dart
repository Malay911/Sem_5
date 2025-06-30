import 'utils/import_export.dart';

class RxListController extends GetxController {
  final items = <ItemModel>[
    ItemModel(name: 'Item 1'),
    ItemModel(name: 'Item 2'),
    ItemModel(name: 'Item 3'),
    ItemModel(name: 'Item 4'),
    ItemModel(name: 'Item 5'),
  ].obs;
}
